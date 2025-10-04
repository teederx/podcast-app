import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_search_query_provider.g.dart';

@riverpod
class SavedSearchQuery extends _$SavedSearchQuery {
  @override
  String build() {
    return '';
  }

  void updateQuery(String query) {
    state = query;
  }
}