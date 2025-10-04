// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_search_query_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SavedSearchQuery)
const savedSearchQueryProvider = SavedSearchQueryProvider._();

final class SavedSearchQueryProvider
    extends $NotifierProvider<SavedSearchQuery, String> {
  const SavedSearchQueryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedSearchQueryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedSearchQueryHash();

  @$internal
  @override
  SavedSearchQuery create() => SavedSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$savedSearchQueryHash() => r'03040e6e2d4684bf22396f50f893a4fa770a96aa';

abstract class _$SavedSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
