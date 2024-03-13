import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertaskapp/custom/custombutton.dart';

class SignupConfirmationScreen extends StatelessWidget {
  const SignupConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 33,
            top: 184,
            right: 33,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                  // height: 80,
                  // width: 120,
                  "assets/images/img_vector_green_a700.svg"),
              // Image.asset(
              //   'img_vector_green_a700.svg', // Replace with your image asset path
              //   height: 80,
              //   width: 120,
              // ),
              SizedBox(height: 34),
              Text(
                "You’re all done!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: 323,
                child: Text(
                  "Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        bottomNavigationBar: _buildGotIt(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildGotIt(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 54,
      ),
      child: CustomButton(
        key: UniqueKey(), //
        text: "Got it!",
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SignupScreen()),
          // );
          // Login action
          print("Login button pressed");
        },
        width: 350,
        height: 45,
        color: Color.fromARGB(255, 216, 102, 37),
        borderRadius: 20,
      ),
    );
  }
}
