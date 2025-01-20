import 'package:smart_eco_mobile/di/container.dart';
import 'package:smart_eco_mobile/di/core_module.dart';

abstract class IDiModule {
  void register(DiContainer di);
}

class AppModule implements IDiModule {
  @override
  void register(DiContainer di) {
    di.registerModule(
      const CoreModule(),
    );
  }
}
