import 'package:flutter/material.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/SignUpformPage4.dart';

class SignupVerificationScreen extends StatelessWidget {
  const SignupVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
              _buildFortyNine(context),
              Spacer(),
              SizedBox(height: 16),
              _buildForty(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFortyNine(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 19, bottom: 12),
          child: Text(
            "Attach proof of registration",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 216, 102, 37),
          ),
          child: IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: () {
              // Action to attach proof of registration
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForty(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => SignupHoursScreen()),
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
