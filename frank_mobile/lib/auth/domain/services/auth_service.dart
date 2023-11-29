import 'dart:developer';
import 'dart:io';

import 'package:frank_mobile/auth/domain/models/auth_model.dart';
import 'package:frank_mobile/auth/domain/services/interface_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      '${dioManager.dio.options.baseUrl}login-v2/',
      data: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      log(name: 'login', response.data.toString());
      return AuthModel.fromJson(response.data);
    } else {
      return throw Exception(); //TODO manejo de errores
    }
  }
}
