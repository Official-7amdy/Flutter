import 'package:bookia_app/Views/Auth/login_screen.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/customWidgets/customTextFormField.dart';
import 'package:bookia_app/core/customWidgets/sucessDialog.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewpass extends StatelessWidget {
  const CreateNewpass({super.key});

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
              "Create new password",
              style: getTitleTextStyle()
          
             ),
             Text(
              "Your new password must be unique from those previously used.",
              style: getSmallHintTextStyle()
          
             ),
             const Gap(50),
               customPassTextFormField(hintText: 'New Password'),

               const Gap(20),
              customPassTextFormField(hintText: 'Confirm Password'),
            
              const Gap(20),
               CustomButton(context, text: 'Reset Password',
                  onPressed: () {
               showSuccessDialog(context: context,newScreen: const LoginScreen());
                    },
               ),
             
          
          
          
              
                 ]
          ),
        ),
      ),
    );
  }
}