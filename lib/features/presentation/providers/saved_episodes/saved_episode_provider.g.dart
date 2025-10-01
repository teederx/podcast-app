// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_episode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SavedEpisode)
const savedEpisodeProvider = SavedEpisodeProvider._();

final class SavedEpisodeProvider
    extends $AsyncNotifierProvider<SavedEpisode, List<EpisodeData>> {
  const SavedEpisodeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedEpisodeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedEpisodeHash();

  @$internal
  @override
  SavedEpisode create() => SavedEpisode();
}

String _$savedEpisodeHash() => r'cd3dc65e2920e4eda4c7f1363196748c7243704c';

abstract class _$SavedEpisode extends $AsyncNotifier<List<EpisodeData>> {
  FutureOr<List<EpisodeData>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<EpisodeData>>, List<EpisodeData>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<EpisodeData>>, List<EpisodeData>>,
        AsyncValue<List<EpisodeData>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
