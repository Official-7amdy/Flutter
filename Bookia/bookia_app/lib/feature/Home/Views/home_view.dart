import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
           Image.asset(
            'assets/images/logo.png',
            height: 40,
           ),
           const Spacer(),
           IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ]
        ),
    )
    );
  }
}