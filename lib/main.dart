import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/modules/auth_module/controller/login_controller.dart';
import 'package:shop_cart/modules/onboarding/controller/onboarding_controller.dart';
import 'package:shop_cart/modules/onboarding/views/splash_screen.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  Get.put(OnboardingController());
  Get.put(LoginController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
