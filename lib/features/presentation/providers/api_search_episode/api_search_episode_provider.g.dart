// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_search_episode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApiSearchEpisode)
const apiSearchEpisodeProvider = ApiSearchEpisodeProvider._();

final class ApiSearchEpisodeProvider
    extends $AsyncNotifierProvider<ApiSearchEpisode, List<EpisodeData>> {
  const ApiSearchEpisodeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'apiSearchEpisodeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$apiSearchEpisodeHash();

  @$internal
  @override
  ApiSearchEpisode create() => ApiSearchEpisode();
}

String _$apiSearchEpisodeHash() => r'3f2421a1954c7e13c360cd0f7b2924cf720a00ea';

abstract class _$ApiSearchEpisode extends $AsyncNotifier<List<EpisodeData>> {
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
