import 'package:bookia_app/feature/Auth/data/Repo/auth_repo.dart'; // Import AuthRepo
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepo(); // Create an instance of AuthRepo

    return BlocProvider(
      create: (BuildContext context) => AuthBloc(authRepo), // Pass AuthRepo to AuthBloc
      child: const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: WelcomeScreen(),
      ),
    );
  }
}
