import 'package:flutter/material.dart';

class CustomEmailFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;

  const CustomEmailFormField({
    required this.hintText,
    this.prefixIcon = Icons.email,
    required this.onChanged,
    this.keyboardType = TextInputType.emailAddress,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 230, 230),
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          border: InputBorder.none, // Remove the bottom border
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
