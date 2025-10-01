// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeData {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get title;
  @HiveField(2)
  String get description;
  @HiveField(3)
  String get audio;
  @HiveField(4)
  @JsonKey(name: 'thumbnail')
  String get image;
  @HiveField(5)
  @JsonKey(name: 'audio_length_sec')
  int get audioLength;

  /// Create a copy of EpisodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EpisodeDataCopyWith<EpisodeData> get copyWith =>
      _$EpisodeDataCopyWithImpl<EpisodeData>(this as EpisodeData, _$identity);

  /// Serializes this EpisodeData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EpisodeData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audioLength, audioLength) ||
                other.audioLength == audioLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, audio, image, audioLength);

  @override
  String toString() {
    return 'EpisodeData(id: $id, title: $title, description: $description, audio: $audio, image: $image, audioLength: $audioLength)';
  }
}

/// @nodoc
abstract mixin class $EpisodeDataCopyWith<$Res> {
  factory $EpisodeDataCopyWith(
          EpisodeData value, $Res Function(EpisodeData) _then) =
      _$EpisodeDataCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) String audio,
      @HiveField(4) @JsonKey(name: 'thumbnail') String image,
      @HiveField(5) @JsonKey(name: 'audio_length_sec') int audioLength});
}

/// @nodoc
class _$EpisodeDataCopyWithImpl<$Res> implements $EpisodeDataCopyWith<$Res> {
  _$EpisodeDataCopyWithImpl(this._self, this._then);

  final EpisodeData _self;
  final $Res Function(EpisodeData) _then;

  /// Create a copy of EpisodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? audio = null,
    Object? image = null,
    Object? audioLength = null,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      audioLength: null == audioLength
          ? _self.audioLength
          : audioLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [EpisodeData].
extension EpisodeDataPatterns on EpisodeData {
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
    TResult Function(_EpisodeData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EpisodeData() when $default != null:
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
    TResult Function(_EpisodeData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EpisodeData():
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
    TResult? Function(_EpisodeData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EpisodeData() when $default != null:
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
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String title,
            @HiveField(2) String description,
            @HiveField(3) String audio,
            @HiveField(4) @JsonKey(name: 'thumbnail') String image,
            @HiveField(5) @JsonKey(name: 'audio_length_sec') int audioLength)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EpisodeData() when $default != null:
        return $default(_that.id, _that.title, _that.description, _that.audio,
            _that.image, _that.audioLength);
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
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String title,
            @HiveField(2) String description,
            @HiveField(3) String audio,
            @HiveField(4) @JsonKey(name: 'thumbnail') String image,
            @HiveField(5) @JsonKey(name: 'audio_length_sec') int audioLength)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EpisodeData():
        return $default(_that.id, _that.title, _that.description, _that.audio,
            _that.image, _that.audioLength);
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
    TResult? Function(
            @HiveField(0) String id,
            @HiveField(1) String title,
            @HiveField(2) String description,
            @HiveField(3) String audio,
            @HiveField(4) @JsonKey(name: 'thumbnail') String image,
            @HiveField(5) @JsonKey(name: 'audio_length_sec') int audioLength)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EpisodeData() when $default != null:
        return $default(_that.id, _that.title, _that.description, _that.audio,
            _that.image, _that.audioLength);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EpisodeData implements EpisodeData {
  const _EpisodeData(
      {@HiveField(0) this.id = '',
      @HiveField(1) this.title = '',
      @HiveField(2) this.description = '',
      @HiveField(3) this.audio = '',
      @HiveField(4) @JsonKey(name: 'thumbnail') this.image = '',
      @HiveField(5) @JsonKey(name: 'audio_length_sec') this.audioLength = 0});
  factory _EpisodeData.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDataFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String id;
  @override
  @JsonKey()
  @HiveField(1)
  final String title;
  @override
  @JsonKey()
  @HiveField(2)
  final String description;
  @override
  @JsonKey()
  @HiveField(3)
  final String audio;
  @override
  @HiveField(4)
  @JsonKey(name: 'thumbnail')
  final String image;
  @override
  @HiveField(5)
  @JsonKey(name: 'audio_length_sec')
  final int audioLength;

  /// Create a copy of EpisodeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EpisodeDataCopyWith<_EpisodeData> get copyWith =>
      __$EpisodeDataCopyWithImpl<_EpisodeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EpisodeDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EpisodeData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audioLength, audioLength) ||
                other.audioLength == audioLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, audio, image, audioLength);

  @override
  String toString() {
    return 'EpisodeData(id: $id, title: $title, description: $description, audio: $audio, image: $image, audioLength: $audioLength)';
  }
}

/// @nodoc
abstract mixin class _$EpisodeDataCopyWith<$Res>
    implements $EpisodeDataCopyWith<$Res> {
  factory _$EpisodeDataCopyWith(
          _EpisodeData value, $Res Function(_EpisodeData) _then) =
      __$EpisodeDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) String audio,
      @HiveField(4) @JsonKey(name: 'thumbnail') String image,
      @HiveField(5) @JsonKey(name: 'audio_length_sec') int audioLength});
}

/// @nodoc
class __$EpisodeDataCopyWithImpl<$Res> implements _$EpisodeDataCopyWith<$Res> {
  __$EpisodeDataCopyWithImpl(this._self, this._then);

  final _EpisodeData _self;
  final $Res Function(_EpisodeData) _then;

  /// Create a copy of EpisodeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? audio = null,
    Object? image = null,
    Object? audioLength = null,
  }) {
    return _then(_EpisodeData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      audioLength: null == audioLength
          ? _self.audioLength
          : audioLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
