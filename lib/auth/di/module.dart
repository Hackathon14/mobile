import 'package:smart_eco_mobile/auth/application/auth_service.dart';
import 'package:smart_eco_mobile/auth/application/register_usecase.dart';
import 'package:smart_eco_mobile/di/container.dart';
import 'package:smart_eco_mobile/di/module.dart';

class AuthModule implements IDiModule {
  const AuthModule();

  @override
  void register(DiContainer di) {
    di.registerFactory<IAuthService>(
      () => AuthService(),
    );
    di.registerFactory(
      () => RegisterUsecase(),
    );
  }
}
