import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcast_app/features/presentation/providers/saved_episodes/saved_episode_provider.dart';

import '../../../../core/utils/formatters.dart'; // Assuming your formatter is here
import '../../../data/model/episode/episode_data.dart';
import '../../providers/audio_player/audio_player_provider.dart';

class PlayEpisodesPage extends ConsumerStatefulWidget {
  static const routeName = '/play_episode_page';
  const PlayEpisodesPage({super.key});

  @override
  ConsumerState<PlayEpisodesPage> createState() => _PlayEpisodesPageState();
}

class _PlayEpisodesPageState extends ConsumerState<PlayEpisodesPage> {
  late final EpisodeData episode;
  bool _isEpisodeInitialized = false;

  @override
  void initState() {
    super.initState();
    // This function will now be async
    _initializePlayer();
  }

  // Create a separate async function for initialization
  Future<void> _initializePlayer() async {
    // This ensures the context is available
    await WidgetsBinding.instance.endOfFrame;

    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs is EpisodeData) {
      episode = routeArgs;
      // You only need to call setState if the build method depends on 'episode'
      // before _isEpisodeInitialized is true. In our case, it's safe.
      if (mounted) {
        setState(() {
          _isEpisodeInitialized = true;
        });
      }

      final player = ref.read(audioPlayerProvider);

      try {
        await player.setUrl(episode.audio);

        // --- THE FIX ---
        // After awaiting, check if the widget is still mounted
        // before proceeding to play the audio.
        if (!mounted) return;

        player.play();
      } catch (e) {
        // Now, this will only catch genuine errors, not the navigation interruption.
        if (e is PlayerInterruptedException) {
          // It's common to ignore this specific error if it's due to navigation.
          print('Audio loading was interrupted, likely by user navigation.');
        } else {
          print("Error loading audio source: $e");
        }
      }
    }
  }

  /* @override
  void dispose() {
    // Stop the player when the screen is disposed to prevent background play
    ref.read(audioPlayerProvider).stop();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator until the episode data is initialized
    if (!_isEpisodeInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final player = ref.watch(audioPlayerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ).copyWith(top: 10.h, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your Top Bar (AppBar)
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                    ),
                    iconSize: 20.sp,
                    icon: const Icon(Icons.keyboard_backspace_rounded),
                  ),
                  const Spacer(),
                  Text(
                    'Now Playing',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              20.verticalSpace,
              // Podcast Image with loading/error handling
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  episode.image,
                  height: 270.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 270.h,
                      color: Colors.grey[800],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 270.h,
                      color: Colors.grey[800],
                      child: const Icon(Icons.error_outline_rounded, size: 50),
                    );
                  },
                ),
              ),
              20.verticalSpace,
              // Episode Title and Bookmark
              Row(
                children: [
                  Expanded(
                    child: Text(
                      episode.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () => ref
                        .read(savedEpisodeProvider.notifier)
                        .toggleSavedEpisode(episode: episode),
                    icon: Icon(ref.watch(savedEpisodeProvider).maybeWhen(
                          orElse: () => Icons.bookmark_outline_rounded,
                          data: (episodeList) => episodeList.contains(episode)
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_outline_rounded,
                        )),
                  )
                ],
              ),
              const Spacer(), // Pushes player controls to the bottom

              // --- AUDIO PLAYER UI ---
              // Progress Slider
              StreamBuilder<Duration>(
                stream: player.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final duration = player.duration ?? Duration.zero;

                  // FIX: Disable slider until duration is available to prevent crash
                  if (duration.inSeconds <= 0) {
                    return const Slider(value: 0.0, onChanged: null);
                  }

                  return Column(
                    children: [
                      Slider(
                        value: position.inSeconds
                            .toDouble()
                            .clamp(0.0, duration.inSeconds.toDouble()),
                        max: duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          player.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatDuration(position)),
                          Text(formatDuration(duration)),
                        ],
                      ),
                    ],
                  );
                },
              ),
              // Playback Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 35,
                    onPressed: () => player
                        .seek(player.position - const Duration(seconds: 10)),
                    icon: const Icon(Icons.replay_10_rounded),
                  ),
                  StreamBuilder<PlayerState>(
                    stream: player.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState = playerState?.processingState;
                      final isPlaying = playerState?.playing ?? false;

                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return const CircularProgressIndicator();
                      } else if (!isPlaying) {
                        return IconButton(
                          iconSize: 60,
                          onPressed: player.play,
                          icon: const Icon(Icons.play_arrow_rounded),
                        );
                      } else if (processingState != ProcessingState.completed) {
                        return IconButton(
                          iconSize: 60,
                          onPressed: player.pause,
                          icon: const Icon(Icons.pause_rounded),
                        );
                      } else {
                        // Show replay button when completed
                        return IconButton(
                          iconSize: 60,
                          onPressed: () => player.seek(Duration.zero),
                          icon: const Icon(Icons.replay_rounded),
                        );
                      }
                    },
                  ),
                  IconButton(
                    iconSize: 35,
                    onPressed: () => player
                        .seek(player.position + const Duration(seconds: 30)),
                    icon: const Icon(Icons.forward_30_rounded),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
