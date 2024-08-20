import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class showLoadingDialog extends StatefulWidget{
  const showLoadingDialog({super.key});

  @override
  State<showLoadingDialog> createState() => _showLoadingDialogState();
}

class _showLoadingDialogState extends State<showLoadingDialog> {
  @override
  Widget build(BuildContext context) {
    
  //loading animation
  return Dialog(
    child: Container(
      height: 100,
      width: 100,
      child: Center(
        child: Lottie.asset('assets/animation/animatedLogo.json'),
        ),
        ),
        );
  }
}
