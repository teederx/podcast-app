// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'podcast_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PodcastData {
  String get id;
  String get title;
  String get image;
  String get description;
  String get publisher;

  /// Create a copy of PodcastData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PodcastDataCopyWith<PodcastData> get copyWith =>
      _$PodcastDataCopyWithImpl<PodcastData>(this as PodcastData, _$identity);

  /// Serializes this PodcastData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PodcastData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, description, publisher);

  @override
  String toString() {
    return 'PodcastData(id: $id, title: $title, image: $image, description: $description, publisher: $publisher)';
  }
}

/// @nodoc
abstract mixin class $PodcastDataCopyWith<$Res> {
  factory $PodcastDataCopyWith(
          PodcastData value, $Res Function(PodcastData) _then) =
      _$PodcastDataCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String image,
      String description,
      String publisher});
}

/// @nodoc
class _$PodcastDataCopyWithImpl<$Res> implements $PodcastDataCopyWith<$Res> {
  _$PodcastDataCopyWithImpl(this._self, this._then);

  final PodcastData _self;
  final $Res Function(PodcastData) _then;

  /// Create a copy of PodcastData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? description = null,
    Object? publisher = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _self.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PodcastData].
extension PodcastDataPatterns on PodcastData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PodcastData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PodcastData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PodcastData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PodcastData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PodcastData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PodcastData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String image, String description,
            String publisher)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PodcastData() when $default != null:
        return $default(_that.id, _that.title, _that.image, _that.description,
            _that.publisher);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String image, String description,
            String publisher)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PodcastData():
        return $default(_that.id, _that.title, _that.image, _that.description,
            _that.publisher);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String title, String image, String description,
            String publisher)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PodcastData() when $default != null:
        return $default(_that.id, _that.title, _that.image, _that.description,
            _that.publisher);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PodcastData implements PodcastData {
  const _PodcastData(
      {this.id = '',
      this.title = '',
      this.image = '',
      this.description = '',
      this.publisher = ''});
  factory _PodcastData.fromJson(Map<String, dynamic> json) =>
      _$PodcastDataFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String publisher;

  /// Create a copy of PodcastData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PodcastDataCopyWith<_PodcastData> get copyWith =>
      __$PodcastDataCopyWithImpl<_PodcastData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PodcastDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PodcastData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, description, publisher);

  @override
  String toString() {
    return 'PodcastData(id: $id, title: $title, image: $image, description: $description, publisher: $publisher)';
  }
}

/// @nodoc
abstract mixin class _$PodcastDataCopyWith<$Res>
    implements $PodcastDataCopyWith<$Res> {
  factory _$PodcastDataCopyWith(
          _PodcastData value, $Res Function(_PodcastData) _then) =
      __$PodcastDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String image,
      String description,
      String publisher});
}

/// @nodoc
class __$PodcastDataCopyWithImpl<$Res> implements _$PodcastDataCopyWith<$Res> {
  __$PodcastDataCopyWithImpl(this._self, this._then);

  final _PodcastData _self;
  final $Res Function(_PodcastData) _then;

  /// Create a copy of PodcastData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? description = null,
    Object? publisher = null,
  }) {
    return _then(_PodcastData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _self.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
