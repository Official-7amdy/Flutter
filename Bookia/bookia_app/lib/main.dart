import 'package:bookia_app/feature/Auth/data/Repo/auth_repo.dart'; // Import AuthRepo
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/splash_screen.dart';
import 'package:bookia_app/services/dio_provider.dart';
import 'package:bookia_app/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await DioProvider.init();
  runApp(const MainApp());
  

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepo(); // Create an instance of AuthRepo

    return BlocProvider(
      create: (BuildContext context) =>
          AuthBloc(authRepo), // Pass AuthRepo to AuthBloc
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
