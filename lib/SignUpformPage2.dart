import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertaskapp/SignUpformPage2.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/custom/customtextfield.dart';
import 'package:fluttertaskapp/SignUpformPage3.dart';

class SignupFarmInfoScreen extends StatelessWidget {
  SignupFarmInfoScreen({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
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
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 37),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "FarmerEats",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Signup 1 of 4",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Farm Info",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomEmailFormField(
                      hintText: "Full Name",
                      prefixIcon: Icons.person,
                      onChanged: (value) {
                        // Handle full name value change
                        print("Full name value changed: $value");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    CustomEmailFormField(
                      hintText: "Email Address",
                      prefixIcon: Icons.email,
                      onChanged: (value) {
                        // Handle email value change
                        print("Email value changed: $value");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
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
                    CustomEmailFormField(
                      hintText: "Phone Number",
                      prefixIcon: Icons.phone,
                      onChanged: (value) {
                        // Handle phone number value change
                        print("Phone number value changed: $value");
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    CustomEmailFormField(
                      hintText: "Password",
                      prefixIcon: Icons.lock,
                      onChanged: (value) {
                        // Handle password value change
                        print("Password value changed: $value");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    CustomEmailFormField(
                      hintText: "Re-enter Password",
                      prefixIcon: Icons.lock,
                      onChanged: (value) {
                        // Handle re-enter password value change
                        print("Re-enter password value changed: $value");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please re-enter your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildFortySeven(context),
                    SizedBox(height: 5),
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

  Widget _buildFortySeven(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18, bottom: 12),
          child: Icon(Icons.arrow_back),
        ),
        Center(
          child: CustomButton(
            key: UniqueKey(), //
            text: "Continue",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignupVerificationScreen()),
              );
              // Login action
              print("Login button pressed");
            },
            width: 120,
            height: 40,
            color: Color.fromARGB(255, 216, 102, 37),
            borderRadius: 20,
          ),
        ),
      ],
    );
  }
}
