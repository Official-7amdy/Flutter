import 'package:bookia_app/core/customWidgets/CustomPassField.dart';
import 'package:bookia_app/core/customWidgets/socialSignIn.dart';
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
        if (state is RegisterSuccessState) {
      pushWithReplacement(context, const HomeView());
            }else if
            (state is RegisterFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed')));
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello! Register to get\n started",
                    style: getTitleTextStyle(),
                  ),
                  const Gap(50),
                  customTextFormField(hintText: 'Enter your username',Textcontroller:nameController ),
                  const Gap(20),
                  customTextFormField(hintText: 'Enter your email',Textcontroller:emailController),
                  const Gap(20),
                  Custompassfield(
                    customHintText: "Password",Textcontroller:passwordController ,
                  ),
                  const Gap(20),
                  Custompassfield(
                    customHintText: "Confirm password",Textcontroller:confirmPasswordController ,
                  ),
                  const Gap(20),
                  state is RegisterLoadingState ?
                  const CircularProgressIndicator() :
                  CustomButton(
                    context,
                    text: 'Register',
                    onPressed: () {
                      context.read<AuthBloc>().add(RegisterEvent(
                        RegisterParams(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConfirmation: confirmPasswordController.text,
                          
                        )
                      ));
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
                          style: getSmallTextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
