// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Episode)
const episodeProvider = EpisodeFamily._();

final class EpisodeProvider
    extends $AsyncNotifierProvider<Episode, List<EpisodeData>> {
  const EpisodeProvider._(
      {required EpisodeFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'episodeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$episodeHash();

  @override
  String toString() {
    return r'episodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Episode create() => Episode();

  @override
  bool operator ==(Object other) {
    return other is EpisodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$episodeHash() => r'5d4419956b93885220c0e4531c9228394be739b9';

final class EpisodeFamily extends $Family
    with
        $ClassFamilyOverride<Episode, AsyncValue<List<EpisodeData>>,
            List<EpisodeData>, FutureOr<List<EpisodeData>>, String> {
  const EpisodeFamily._()
      : super(
          retry: null,
          name: r'episodeProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  EpisodeProvider call({
    required String podcastId,
  }) =>
      EpisodeProvider._(argument: podcastId, from: this);

  @override
  String toString() => r'episodeProvider';
}

abstract class _$Episode extends $AsyncNotifier<List<EpisodeData>> {
  late final _$args = ref.$arg as String;
  String get podcastId => _$args;

  FutureOr<List<EpisodeData>> build({
    required String podcastId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      podcastId: _$args,
    );
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
