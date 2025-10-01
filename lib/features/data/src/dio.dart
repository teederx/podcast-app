import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://listen-api.listennotes.com/api/v2',
    headers: {
      'Content-Type': 'application/json',
      'X-ListenAPI-Key': dotenv.env['API_KEY'] ?? ''
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ),
);
