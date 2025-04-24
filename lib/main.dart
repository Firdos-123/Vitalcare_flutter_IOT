import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' show Platform;
import 'common/color_extension.dart';
import 'view/login/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: Platform.isAndroid
        ? const FirebaseOptions(
      apiKey: "AIzaSyB5GbgQeyYDKe8NsJyTNWAkUH8cz_u8zfE",
      appId: "1:948749616958:android:64e13c3b2b5e6683c24e6f",
      messagingSenderId: "948749616958",
      projectId: "vitalcare-app",
    )
        : null, // Use default config for iOS
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const OnBoardingView(),
    );
  }
}
