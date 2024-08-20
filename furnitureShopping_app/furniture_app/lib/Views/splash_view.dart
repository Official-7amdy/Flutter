import 'package:flutter/material.dart';
import 'package:furniture_app/Views/LoginView.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
   void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const LoginView();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animation/animatedLogo.json'),
        ),
    );
  }
}