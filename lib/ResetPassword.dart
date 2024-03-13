import 'package:flutter/material.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/custom/customtextfield.dart';

class LoginResetPasswordScreen extends StatelessWidget {
  LoginResetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController newpasswordController1 = TextEditingController();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FarmerEats",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 90),
                    Text(
                      "Reset Password",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 24),
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
                      hintText: "New Password",
                      prefixIcon: Icons.lock,
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
                    //   controller: newpasswordController,
                    //   decoration: InputDecoration(
                    //     hintText: "New Password",
                    //     prefixIcon: Icon(Icons.lock),
                    //   ),
                    //   keyboardType: TextInputType.visiblePassword,
                    //   obscureText: true,
                    // ),
                    SizedBox(height: 24),
                    CustomEmailFormField(
                      hintText: "Confirm New Password",
                      prefixIcon: Icons.lock,
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
                    //   controller: newpasswordController1,
                    //   decoration: InputDecoration(
                    //     hintText: "Confirm New Password",
                    //     prefixIcon: Icon(Icons.lock),
                    //   ),
                    //   keyboardType: TextInputType.visiblePassword,
                    //   obscureText: true,
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
                                builder: (context) =>
                                    LoginResetPasswordScreen()),
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

                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Submit action
                    //   },
                    //   child: Text("Submit"),
                    // ),
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
}
