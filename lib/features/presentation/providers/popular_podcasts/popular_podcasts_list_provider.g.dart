// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_podcasts_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PopularPodcastsList)
const popularPodcastsListProvider = PopularPodcastsListProvider._();

final class PopularPodcastsListProvider
    extends $AsyncNotifierProvider<PopularPodcastsList, List<PodcastData>> {
  const PopularPodcastsListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'popularPodcastsListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$popularPodcastsListHash();

  @$internal
  @override
  PopularPodcastsList create() => PopularPodcastsList();
}

String _$popularPodcastsListHash() =>
    r'f5b16bee4737698f8a261f3d63e20aee24edf4f0';

abstract class _$PopularPodcastsList extends $AsyncNotifier<List<PodcastData>> {
  FutureOr<List<PodcastData>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<PodcastData>>, List<PodcastData>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<PodcastData>>, List<PodcastData>>,
        AsyncValue<List<PodcastData>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
