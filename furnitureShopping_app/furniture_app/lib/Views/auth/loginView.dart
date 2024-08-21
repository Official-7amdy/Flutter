import 'package:flutter/material.dart';
import 'package:furniture_app/Views/auth/forgetPass.dart';
import 'package:furniture_app/Views/auth/signUp_view.dart';
import 'package:furniture_app/core/PublicWidgets/loading.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                 SizedBox(height:  MediaQuery.sizeOf(context).height / 5,), // Adds space from the top
                const Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 9,
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
                    return null;
                  },
                  onTap: _scrollToBottom,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Forgot Password
                Center(
                  child: TextButton(
                    onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Forgetpass()));
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                        "Login",
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
                  child: TextButton(
                    onPressed: () {
                      // Handle sign-up action
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupView()));
                      
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
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

