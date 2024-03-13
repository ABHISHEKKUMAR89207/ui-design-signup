import 'package:flutter/material.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/custom/customtextfield.dart';
import 'package:fluttertaskapp/ResetPassword.dart';

class LoginOtpScreen extends StatelessWidget {
  const LoginOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
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
                "Verify OTP",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 21),
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
                    style: TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 68),
              CustomEmailFormField(
                hintText: "Enter OTP",
                prefixIcon: Icons.mail,
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
              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Enter OTP',
              //   ),
              //   onChanged: (value) {
              //     // OTP input logic
              //   },
              // ),
              SizedBox(height: 32),
              Center(
                child: CustomButton(
                  key: UniqueKey(), //
                  text: "Submit",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginResetPasswordScreen()),
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

              SizedBox(height: 18),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // Resend code action
                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: GestureDetector(
              //     onTap: () {
              //       // Resend code action

              //     },
              //     child: Text(
              //       "Resend Code",
              //       style: TextStyle(
              //         decoration: TextDecoration.underline,
              //         color: Colors.black87,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
