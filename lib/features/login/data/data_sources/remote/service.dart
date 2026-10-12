import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/resource/data_state.dart';

class LoginServices {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  LoginServices(this._dio, this._storage);

  Future<DataState<void>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/login',
        data: {'email': email.trim(), 'password': password},
        options: Options(extra: {'auth-free': true}),
      );

      final data = response.data;

      if (data == null) {
        return DataFailed(error: 'Empty server response.');
      }

      final token = data['accessToken'];
      final userId = data['userId'];
      final userEmail = data['email'];
      final expiresAt = data['expiresAtUtc'];

      if (token is! String ||
          token.isEmpty ||
          userId is! String ||
          userEmail is! String ||
          expiresAt is! String) {
        return DataFailed(error: 'Invalid login response.');
      }

      final expiration = DateTime.tryParse(expiresAt)?.toUtc();

      if (expiration == null || !expiration.isAfter(DateTime.now().toUtc())) {
        return DataFailed(error: 'Invalid token expiration.');
      }

      // Store authentication credentials before reporting success.
      await _storage.write(key: 'peng.cafe.auth.access_token', value: token);

      await _storage.write(
        key: 'peng.cafe.auth.expires_at',
        value: expiration.toIso8601String(),
      );

      await _storage.write(key: 'peng.cafe.auth.user_id', value: userId);

      await _storage.write(key: 'peng.cafe.auth.email', value: userEmail);

      return DataSuccess<void>(data: null);
    } on DioException catch (e) {
      final status = e.response?.statusCode;

      if (status == 401) {
        return DataFailed(error: 'Invalid email or password.');
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        return DataFailed(error: 'Cannot connect to Peng SaaS server.');
      }

      return DataFailed(error: 'Login failed (HTTP ${status ?? 'unknown'}).');
    } catch (_) {
      return DataFailed(error: 'Unable to save login session.');
    }
  }
}
