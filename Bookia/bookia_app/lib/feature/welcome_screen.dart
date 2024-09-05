import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/feature/Auth/Views/login_screen.dart';
import 'package:bookia_app/feature/Auth/Views/signup_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

 class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
               AppAssets.welcomeBackground,
               fit: BoxFit.fill,
            
            ),
      ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              const Gap(150),  
              Center(
                child:  Image.asset(
                   AppAssets.logo,
                    fit: BoxFit.cover,                   
                    )
                ),
                Text("Order Your Book Now!",
                
                 style:getSmallTitleTextStyle()
                 ),    
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(context, text: 'Login',
                onPressed: () {
                  push(context, const LoginScreen());
                  },
                ),
                 const Gap(20),
                 WhiteCustomButton(context, text: 'Register',
                onPressed: () {
                  push(context, const SignUpScreen());
                  }
                ),
                const Gap(150),
              ],
            ),
          )
          
        ]
      ),
    );
  }

  
} 