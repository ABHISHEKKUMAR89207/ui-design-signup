import 'package:flutter/material.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/SignUpformPage6.dart';

class SignupVerificationOneScreen extends StatelessWidget {
  SignupVerificationOneScreen({Key? key}) : super(key: key);

  TextEditingController weburlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FarmerEats",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 32),
              Text(
                "Signup 3 of 4",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 5),
              Text(
                "Verification",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                width: 309,
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(height: 35),
              _buildFifty(context),
              SizedBox(height: 40),
              TextFormField(
                controller: weburlController,
                decoration: InputDecoration(
                  hintText: "usda_registration.pdf",
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Implement suffix icon action
                    },
                    icon: Icon(Icons.close),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 13,
                    bottom: 13,
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
              Spacer(),
              SizedBox(height: 16),
              _buildThirtyNine(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFifty(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 19,
            bottom: 12,
          ),
          child: Text(
            "Attach proof of registration",
            style:
                TextStyle(fontSize: 16, color: Colors.black87), // Example style
          ),
        ),
        IconButton(
          onPressed: () {
            // Implement camera icon action
          },
          icon: Icon(Icons.camera_alt),
          iconSize: 53,
          padding: EdgeInsets.all(14),
        ),
      ],
    );
  }

  Widget _buildThirtyNine(BuildContext context) {
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
                    builder: (context) => SignupConfirmationScreen()),
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
