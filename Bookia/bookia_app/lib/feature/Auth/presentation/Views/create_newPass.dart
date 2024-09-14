import 'package:bookia_app/core/customWidgets/CustomPassField.dart';
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/customWidgets/sucessDialog.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewpass extends StatefulWidget {
  const CreateNewpass({super.key});

  @override
  State<CreateNewpass> createState() => _CreateNewpassState();
}

class _CreateNewpassState extends State<CreateNewpass> {
  bool isPasswordVisible = false;
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
            Text("Create new password", style: getTitleTextStyle()),
            Text("Your new password must be unique from those previously used.",
                style: getSmallHintTextStyle()),
            const Gap(50),
            const Custompassfield(
              customHintText: "New Password",
            ),
            const Gap(20),
            const Custompassfield(
              customHintText: "Confirm Password",
            ),
            const Gap(20),
            CustomButton(
              context,
              text: 'Reset Password',
              onPressed: () {
                showSuccessDialog(
                    context: context, ConstrutionText: 'Email Sent Sucessfuly');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
