import 'package:frank_mobile/config/network/dio_manager.dart';
import 'package:frank_mobile/auth/domain/models/auth_model.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<AuthModel?> login({
    required String email,
    required String password,
  });
}
