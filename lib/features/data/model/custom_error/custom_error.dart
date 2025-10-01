import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_error.freezed.dart';

@freezed
abstract class CustomError with _$CustomError {
  const factory CustomError({
    @Default('') String code,
    @Default('') String message,
  }) = _CustomError;
}
