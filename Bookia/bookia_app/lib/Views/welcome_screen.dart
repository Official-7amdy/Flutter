import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
               'assets/images/welcome_background.png',
               fit: BoxFit.fill,
            
            ),
      ),
   
          
      
      
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              const Gap(150),
              
              Center(
                child:  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    
                    
                    )
                ),
                Text("Order Your Book Now!",
                
                 style: GoogleFonts.dmSerifDisplay(
                  textStyle: getTitleTextStyle()
                 ),
                )
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                CustomButton(context, text: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                  },
                
                ),
                 const Gap(20),
                 WhiteCustomButton(context, text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                  },
                 
                
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