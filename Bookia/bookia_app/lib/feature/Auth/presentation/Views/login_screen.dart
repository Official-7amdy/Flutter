import 'package:bookia_app/core/customWidgets/CustomPassField.dart';
import 'package:bookia_app/core/customWidgets/socialSignIn.dart';
import 'package:bookia_app/feature/Auth/presentation/Views/forgotPass_screen.dart';
import 'package:bookia_app/feature/Auth/presentation/Views/signup_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/customWidgets/customTextFormField.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Welcome back! Glad \nto see you, Again!",
                style: getTitleTextStyle()),
            const Gap(50),
            customTextFormField(hintText: 'Enter your email'),
            const Gap(20),
            const Custompassfield(
              customHintText: "Enter your password",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      push(context, const ForgotpassScreen());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: getSmallTextStyle(),
                    )),
              ],
            ),
            const Gap(20),
            CustomButton(
              context,
              text: 'Login',
              onPressed: () {
                pushWithReplacement(context, const HomeView());
              },
            ),
            const Gap(50),
            Center(
                child: Text(
              'Or Login With',
              style: getSmallTextStyle(),
            )),
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
                    pushWithReplacement(context, const SignUpScreen());
                  },
                  child: Text(
                    'Sign Up',
                    style: getSmallTextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
