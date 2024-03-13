import 'package:flutter/material.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/custom/customtextfield.dart';
import 'package:fluttertaskapp/verifyotp.dart';

class LoginForgotPasswordScreen extends StatelessWidget {
  LoginForgotPasswordScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Add GestureDetector here
      onTap: () {
        // Dismiss keyboard when tapped outside of text fields
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FarmerEats",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 93),
                      Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Remember your password",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            "?  ",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 16, color: Colors.orange),
                          ),
                        ],
                      ),
                      SizedBox(height: 68),
                      CustomEmailFormField(
                        hintText: "Enter your email",
                        prefixIcon: Icons.phone,
                        onChanged: (value) {
                          // Handle email value change
                          print("Email value changed: $value");
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          // You can add more validation logic here
                          return null; // Return null if validation succeeds
                        },
                      ),
                      SizedBox(height: 32),
                      Center(
                        child: CustomButton(
                          key: UniqueKey(), //
                          text: "Send Code",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginOtpScreen()),
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
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
