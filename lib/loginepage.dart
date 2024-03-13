import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertaskapp/SignUpform.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/custom/customtextfield.dart';
import 'package:fluttertaskapp/forgotpage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  String email = '';
  String password = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 29, vertical: 37),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FarmerEats",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 90),
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: [
                        Text(
                          "New here?  ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "Create account",
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                      ],
                    ),
                    SizedBox(height: 69),
                    CustomEmailFormField(
                      hintText: "Enter your email",
                      prefixIcon: Icons.mail,
                      onChanged: (value) {
                        // Handle email value change
                        print("Email value changed: $value");
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 230, 230),
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Forgot password action
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Login navigation or functionality goes here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginForgotPasswordScreen()),
                                  );
                                },
                                child: Text(
                                  "Forgot?",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          border: InputBorder.none, // Remove the bottom border
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: CustomButton(
                        key: UniqueKey(), //
                        text: "Login",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          );
                          // Login action
                          print("Login button pressed");
                        },
                        width: 350,
                        height: 45,
                        color: Color.fromARGB(255, 216, 102, 37),
                        borderRadius: 20,
                      ),
                    ),
                    SizedBox(height: 33),
                    Center(
                      child: Text(
                        "or login with",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSocialButton(
                          svgPath: "assets/images/img_google.svg",
                          onPressed: () {
                            // Google login action
                          },
                        ),
                        _buildSocialButton(
                          svgPath: "assets/images/img_linkedin.svg",
                          onPressed: () {
                            // Apple login action
                          },
                        ),
                        _buildSocialButton(
                          svgPath: "assets/images/img_facebook.svg",
                          onPressed: () {
                            // Facebook login action
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      {required String svgPath, required VoidCallback onPressed}) {
    return Container(
      height: 52,
      width: 96,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(26),
      ),
      child: IconButton(
        icon: SvgPicture.asset(svgPath), // Use SvgPicture.asset
        onPressed: onPressed,
      ),
    );
  }
}
