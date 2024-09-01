import 'package:bookia_app/Views/Auth/otp_screen.dart';
import 'package:bookia_app/Views/Auth/signup_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/customWidgets/customTextFormField.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotpassScreen extends StatelessWidget {
  const ForgotpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
              "Forgot Password?",
              style: getTitleTextStyle()
          
             ),
             Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: getSmallHintTextStyle()
          
             ),
             const Gap(50),
              customTextFormField(hintText: 'Enter your email'),
              
              const Gap(20),
               CustomButton(context, text: 'Send Code',
                  onPressed: () {
                    push(context, const OtpScreen());
                    },
               ),
               Gap(
                 MediaQuery.sizeOf(context).height /2.2,
               ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Remember password?',style:getSmallTextStyle(),),
                    TextButton(onPressed: (){
                      pushWithReplacement(context, const SignUpScreen());
                    }, child: Text('Login',style:getSmallTextStyle(color: AppColors.primaryColor),
                    ),),
                  ],
                )
          
          
          
              
                 ]
          ),
          
        ),
      ),
    );
  }
}