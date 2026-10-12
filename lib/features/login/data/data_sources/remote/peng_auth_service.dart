import 'package:dio/dio.dart';

class PengAuthService {
  final Dio _dio;

  PengAuthService(this._dio);

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/auth/login',
      data: {'email': email.trim(), 'password': password},
      options: Options(extra: {'auth-free': true}),
    );

    final data = response.data;

    if (data == null) {
      throw const FormatException('Empty login response');
    }

    return data;
  }
}
