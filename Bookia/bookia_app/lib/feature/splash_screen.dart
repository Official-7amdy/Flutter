import 'package:flutter/material.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/feature/Home/Views/home_view.dart';
import 'package:bookia_app/feature/welcome_screen.dart';
import 'package:bookia_app/services/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String token = LocalStorage.getData(key: LocalStorage.token);
      pushWithReplacement(
        context,
        (token.isNotEmpty)
            ? const HomeView()
            : const WelcomeScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
