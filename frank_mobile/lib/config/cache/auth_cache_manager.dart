import 'package:frank_mobile/config/cache/cache_manager.dart';
import 'package:frank_mobile/config/network/dio_manager.dart';

class AuthCacheManager {
  Future<bool> isFirstEntry() async {
    return !(await CacheManager.getBool('isFirstEntry') ?? false);
  }

  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool('login')) ?? false;
  }

  Future<void> signOut() async {
    await CacheManager.clearAll();
  }

  Future<void> updateFirstEntry() async {
    await CacheManager.setBool('isFirstEntry', true);
  }

  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool('login', isLoggedIn);
  }

  Future<void> updateToken(String? token) async {
    if (token != null) {
      await CacheManager.setString('token', token);
      DioManager.instance.dio.options
          .headers[(MapEntry('Authorization', 'token $token'))];
    } else {
      if (await CacheManager.containsKey('token')) {
        await CacheManager.remove('token');
        DioManager.instance.dio.options.headers.clear();
      }
    }
  }

  Future<void> updateTokenFromStorage() async {
    if (await CacheManager.containsKey('token')) {
      final token = await CacheManager.getString('token');
      if (token != null) {
        DioManager.instance.dio.options
            .headers[(MapEntry('Authorization', 'token $token'))];
      }
    }
  }
}
