import 'package:flutter/material.dart';
import 'package:furniture_app/PublicWidgets/loading.dart';
import 'package:furniture_app/core/auth/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late String pass;
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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 5,
                ), // Adds space from the top
                const Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Welcome ",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 15,
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
