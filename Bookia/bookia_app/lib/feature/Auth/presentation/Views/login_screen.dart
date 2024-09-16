import 'package:bookia_app/core/customWidgets/customTextFormField.dart';
import 'package:bookia_app/core/customWidgets/socialSignIn.dart';
import 'package:bookia_app/core/customWidgets/sucessDialog.dart';
import 'package:bookia_app/feature/Auth/presentation/Views/forgotPass_screen.dart';
import 'package:bookia_app/feature/Auth/presentation/Views/signup_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/Home/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: context.read<AuthBloc>(), // Add this to specify the Bloc
      listener: (BuildContext context, state) {
        if (state is LoginLoadingState) {
          // Show the custom loading dialog when loading
          showLoadingDialog(context: context);
        } else if (state is LoginSuccessState) {
        
          showSuccessDialog(
              context: context, ConstrutionText: "Signed In Sucessfully");
          Future.delayed(const Duration(seconds: 2), () {

            // ignore: use_build_context_synchronously
            Navigator.pop(context); // Close the loading dialog
            pushAndRemoveUntil(context, const HomeView());
          });
        } else if (state is LoginFailureState) {
          Navigator.pop(context); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: AppColors.redColor,
            content: Text('Wrong  email or password'),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back! Glad \nto see you, Again!",
                    style: getTitleTextStyle(),
                  ),
                  const Gap(50),
                  CustomTextFormField(
                    hintText: 'Enter your email',
                    controller: emailController,
                    validatorText: "Enter a valid email",
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    isPassword: true,
                    hintText: 'Password',
                    controller: passwordController,
                    validatorText: "Enter a valid password",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                         pushWithSlideTransition(context, const ForgotpassScreen());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: getSmallTextStyle(),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  CustomButton(
                    context,
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      }
                    },
                  ),
                  const Gap(50),
                  Center(
                    child: Text(
                      'Or Login With',
                      style: getSmallTextStyle(),
                    ),
                  ),
                  const Gap(20),
                  const Social_SignIn(),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: getSmallTextStyle(),
                      ),
                      TextButton(
                        onPressed: () {
                          pushWithSlideTransition(context, const SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style:
                              getSmallTextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
