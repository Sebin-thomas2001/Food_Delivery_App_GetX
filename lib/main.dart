import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/modules/auth_module/controller/auth_controller.dart';
import 'package:shop_cart/modules/kyc_module/views/create_bio_view.dart';
import 'package:shop_cart/modules/onboarding/controller/onboarding_controller.dart';
import 'package:shop_cart/modules/onboarding/views/splash_screen.dart';

const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyCAU8Y-zuBCPkWUv1XByCrgZSheRY43wwk",
  authDomain: "food-ninja-94165.firebaseapp.com",
  projectId: "food-ninja-94165",
  storageBucket: "food-ninja-94165.firebasestorage.app",
  messagingSenderId: "52168128364",
  appId: "1:52168128364:web:f6f3cd96fc8b9174d96549",
  measurementId: "G-7NPF6MQT81"
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);

  Get.put(OnboardingController());
  Get.put(AuthController());
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
