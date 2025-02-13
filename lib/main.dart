import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_eco_mobile/di/container.dart';
import 'package:smart_eco_mobile/di/module.dart';
import 'package:smart_eco_mobile/nav/router.dart';
import 'package:smart_eco_mobile/utils/color.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

void main() {
  di.registerModule(AppModule());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'SmartEco');
    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.FRENCH
    ];
    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;

    _router = createRouter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Eco Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _router,
    );
  }
}
