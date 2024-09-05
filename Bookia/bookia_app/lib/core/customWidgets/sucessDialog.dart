import 'package:bookia_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

 showSuccessDialog({required BuildContext context,required newScreen }) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents the user from closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                 AppAssets.animatedSucess,
                  width: 200,
                  height: 200,
                  repeat: false,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Email Sent Successfully!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                 const Text(
                  'Returning to login screen',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 35),

              ],
            ),
          ),
        );
      },
    );

    // Automatically close the dialog after 2 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
      Navigator.popUntil(context, (route) => route.isFirst);

    
    });
  }