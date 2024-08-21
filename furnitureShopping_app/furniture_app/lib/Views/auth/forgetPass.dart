 import 'package:flutter/material.dart';
import 'package:furniture_app/core/PublicWidgets/loading.dart';
import 'package:lottie/lottie.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
               
                  
               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  
                   Container(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('assets/animation/animatedForgotPass.json')),
                 ],
               ),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
               
                
                const Text(
                  "Please enter your Email to change your password",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 20,
                ),
                // Email field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    Dialog(
                      child: Text('Email is valid'),
                      
                    );
                    return null;
                  },
                  onTap: _scrollToBottom,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Password field
               
                const SizedBox(
                  height: 40,
                ),
                // Forgot Password
             
                // Login Button
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              // Loading dialog
                             showLoadingDialog;
                            });                          
                          // Handle login action
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff000000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Sign Up
              
                const SizedBox(height: 80), // Adds space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}