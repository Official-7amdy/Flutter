import 'package:bookia_app/core/customWidgets/socialSignIn.dart';
import 'package:bookia_app/core/customWidgets/sucessDialog.dart';
import 'package:bookia_app/feature/Auth/data/Models/request/register_params.dart';
import 'package:bookia_app/feature/Auth/presentation/Views/login_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/customWidgets/customTextFormField.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          // Show the custom loading dialog when loading
          showLoadingDialog(context: context);
        } else if (state is RegisterSuccessState) {
          Navigator.pop(context); // Close the loading dialog
          pushWithReplacement(context, const  LoginScreen());
        } else if (state is RegisterFailureState) {
          Navigator.pop(context); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: AppColors.redColor,
            content: Text('Email already been used'),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                      "Hello! Register to get\n started",
                      style: getTitleTextStyle(),
                    ),
                    const Gap(50),
                    CustomTextFormField(
                      hintText: 'Enter your username',
                      controller: nameController,
                      validatorText: "Enter Your username",
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      hintText: 'Enter your email',
                      controller: emailController,
                      validatorText: 'Please enter a valid email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      isPassword: true,
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      isPassword: true,
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                      validatorText: 'Passwords do not match',
                    ),
                    const Gap(20),
                    CustomButton(
                      context,
                      text: 'Register',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: AppColors.redColor,
                              content: Text('Passwords do not match'),
                            ));
                          } else {
                            context.read<AuthBloc>().add(RegisterEvent(
                                  RegisterParams(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text,
                                  ),
                                ));
                          }
                        }
                      },
                    ),
                    const Gap(50),
                    Center(
                      child: Text(
                        'Or Register With',
                        style: getSmallTextStyle(),
                      ),
                    ),
                    const Gap(20),
                    const Social_SignIn(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: getSmallTextStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            pushWithReplacement(context, const LoginScreen());
                          },
                          child: Text(
                            'Login Now',
                            style: getSmallTextStyle(
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
