import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture_app/PublicWidgets/loading.dart';
import 'package:furniture_app/core/auth/login_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late String pass;
  final _formKey = GlobalKey<FormState>();
  String? image;

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
void _showSourceSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true, // Prevents the user from closing the dialog by tapping outside
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
        

      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              
              children: [
                Container(
                  child: Lottie.asset(
                    'assets/animation/animatedUser.json',
                    width: 100,
                    height: 100,
                    repeat: false,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.3,
                                    height: 50,

                  child: ElevatedButton(
                    onPressed: () {
                      // using image picker to acess camera and pick an image
                      ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                        if (value!= null)
                        setState(() {
                          image = value.path;
                          });
                          });
                          
                     
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined,
                        color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Camera",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                       ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                        if (value!= null)
                        setState(() {
                          image = value.path;
                          });
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.browse_gallery_outlined,
                        color: Colors.white),
                        const SizedBox(width: 10),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                
                const SizedBox(height: 35),
              ],
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 7,
                ), // Adds space from the top
                
              Stack(
                children:[
                  CircleAvatar(
                  radius: 60,
                  backgroundImage:(image!= null) ?FileImage(File(image!)): AssetImage('assets/images/user.jpeg')
                ),
                //ICON TO ADD A PROFILE PIC
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      ),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        // opens a dialog to choose the pic source
                        
                         _showSourceSheet(
                              context); 
                        
                        
                       
                        },
                        ),
                  ),
                      ),

                  
                ] 
              ),
                const Text(
                  "Welcome !",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "Sign Up ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 20,
                ),
                // UserName field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                     border:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onTap: _scrollToBottom,
                ),
                const SizedBox(
                  height: 20,
                ),TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                     border:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onTap: _scrollToBottom,
                ),
                const SizedBox(
                  height: 20,
                ),
               
               
                // Password field
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password_outlined),
                    labelText: "Password",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    pass=value;
                    return null;
                  },
                  onTap: _scrollToBottom,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password_outlined),
                    labelText: "Confirm Password",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value != pass ) {
                      return 'Passwords are not same';
                    }
                    return null;
                  },
                  onTap: _scrollToBottom,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Forgot Password
               
                
                // SignUp Button
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
                        "Sign Up",
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
                 Center(
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text(
                          "Already have account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )
                      ),
                       TextButton(
                        onPressed: () {
                           Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => LoginView()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
                                             ),
                     ],
                   ),
                 ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(height: 80), // Adds space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
