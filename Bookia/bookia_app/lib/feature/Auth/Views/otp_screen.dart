import 'package:bookia_app/feature/Auth/Views/create_newPass.dart';
import 'package:bookia_app/feature/Auth/Views/signup_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              "OTP Verification",
              style: getTitleTextStyle()
          
             ),
             Text(
              "Enter the verification code we just sent on\n your email address.",
              style: getSmallHintTextStyle()
          
             ),
             const Gap(20),
             Pinput(
               // ignore: avoid_print
               onCompleted: (pin) => print(pin),
          defaultPinTheme:PinTheme(
            width: 70,
            height: 70,
            textStyle: getTitleTextStyle(),
            decoration: BoxDecoration(
              border: Border.all(color:AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ) ,
             ),
             const Gap(30),
             CustomButton(context, text: "Verify", onPressed: (){
              push(context, const CreateNewpass());
             }),
       
              
             
                 Gap(MediaQuery.sizeOf(context).height /2.2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t received code?',style:getSmallTextStyle(),),
                    TextButton(onPressed: (){
                      pushWithReplacement(context, const SignUpScreen());
                    }, child: Text('Resend',style:getSmallTextStyle(color: AppColors.primaryColor),
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