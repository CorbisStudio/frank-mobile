import 'package:dartz/dartz.dart';
import 'package:frank_mobile/config/network/dio_manager.dart';
import 'package:frank_mobile/auth/domain/models/auth_model.dart';
import 'package:frank_mobile/utils/errors/failure.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<Either<Failure, AuthModel>?> login({
    required String email,
    required String password,
  });
}
