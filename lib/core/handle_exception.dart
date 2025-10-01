import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podcast_app/features/data/model/custom_error/custom_error.dart';

CustomError handleException(dynamic e) {
  try {
    throw e;
  } on DioException catch (e) {
    final data = e.response?.data;
    String code = '';
    String message = 'Something went wrong.';

    if (data is Map<String, dynamic>) {
      code = data['status_code']?.toString() ?? '';
      message = data['message'] ?? 'An unknown error occurred.';
    }
    return CustomError(code: code, message: message);
  } on HiveError catch (e) {
    return CustomError(
      code: 'Hive Error',
      message: e.message,
    );
  } catch (e) {
    return CustomError(
      code: 'Error',
      message: e.toString(),
    );
  }
}
