import 'package:smart_eco_mobile/auth/di/module.dart';
import 'package:smart_eco_mobile/di/container.dart';
import 'package:smart_eco_mobile/di/module.dart';

class CoreModule implements IDiModule {
  const CoreModule();

  @override
  void register(DiContainer di) {
    di.registerModule(AuthModule());
  }
}
