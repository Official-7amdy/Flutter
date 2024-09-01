import 'package:bookia_app/Views/Auth/login_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/customWidgets/customTextFormField.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              "Hello! Register to get\n started",
              style:getTitleTextStyle()
          
             ),
             const Gap(50),
              customTextFormField(hintText: 'Enter your username'),
               const Gap(20),
              customTextFormField(hintText: 'Enter your email'),
              const Gap(20),
               customPassTextFormField(hintText: 'Enter your Password'),
               const Gap(20),
              customPassTextFormField(hintText: 'Confirm your Password'),
              
              const Gap(20),
               CustomButton(context, text: 'Register',
                  onPressed: () {
                    pushWithReplacement(context, const SignUpScreen());
                    },
               ),
               const Gap(50),
                Center(child: Text('Or Register With',style:getSmallTextStyle(),)),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset('assets/icons/facebook.png',width: 30,height: 30,)),
                      IconButton(onPressed: (){}, icon: Image.asset('assets/icons/google.png',width: 30,height: 30,)),
                       IconButton(onPressed: (){}, icon: Image.asset('assets/icons/apple.png',width: 30,height: 30,))
                    ],
                  ),
                  
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',style:getSmallTextStyle(),),
                    TextButton(onPressed: (){
                      pushWithReplacement(context, const LoginScreen());
                    }, child: Text('Login Now',style:getSmallTextStyle(color: AppColors.primaryColor),
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