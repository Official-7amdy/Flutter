import 'package:bookia_app/core/customWidgets/appBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/feature/welcome_screen.dart';
import 'package:bookia_app/services/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String? token = LocalStorage.getData(
          key: LocalStorage.token); // Allow token to be nullable
      if (token != null && token.isNotEmpty) {
        pushWithReplacement(context, const AppBottomNavigationBar());
      } else {
        pushWithReplacement(context, const WelcomeScreen());
      }
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
