import 'package:flutter/material.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';
import 'package:fluttertaskapp/SignUpformPage5.dart';

class SignupHoursScreen extends StatelessWidget {
  const SignupHoursScreen({Key? key}) : super(key: key);

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
                "Signup 4 of 4",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 5),
              Text(
                "Business Hours",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Container(
                width: 314,
                margin: EdgeInsets.only(right: 15),
                child: Text(
                  "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(height: 36),
              _buildFortyTwo(context),
              SizedBox(height: 30),
              _buildFortyFour(context),
              Spacer(),
              SizedBox(height: 16),
              _buildFortyEight(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFortyTwo(BuildContext context) {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      children: List<Widget>.generate(
          7, (index) => Container(/* Your item widget here */)),
    );
  }

  Widget _buildFortyFour(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List<Widget>.generate(
          5, (index) => Container(/* Your item widget here */)),
    );
  }

  Widget _buildFortyEight(BuildContext context) {
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
                    builder: (context) => SignupVerificationOneScreen()),
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
