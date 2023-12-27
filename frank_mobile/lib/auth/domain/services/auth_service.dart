import 'dart:io';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import 'package:frank_mobile/utils/errors/failure.dart';
import 'package:frank_mobile/auth/domain/models/auth_model.dart';
import 'package:frank_mobile/auth/domain/services/interface_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<Either<Failure, AuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dioManager.dio.post(
        '${dioManager.dio.options.baseUrl}login-v2/',
        data: {
          'username': email,
          'password': password,
        },
      );

      log(name: 'login', response.data.toString());

      if (response.statusCode == HttpStatus.ok) {
        return right(AuthModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return left(
          const ApiFailure(
            message: 'Wrong email or password',
            statusCode: '400',
          ),
        );
      } else {
        return left(
          ApiFailure(
            message: e.response.toString(),
            statusCode: e.response!.statusCode.toString(),
          ),
        );
      }
    }
    return left(
      const ApiFailure(
        message: 'Unknown error',
        statusCode: '1',
      ),
    );
  }
}
