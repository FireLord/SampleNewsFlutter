import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String labelText;
  final bool isPassword;
  final Function(String) textValue;

  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.labelText,
    this.isPassword = false,
    required this.textValue,
  });

  @override
  Widget build(BuildContext context) {
    if (isPassword) {
      return TextFormField(
        onChanged: (value) => textValue(value),
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      );
    } else {
      return TextFormField(
        onChanged: textValue,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      );
    }
  }
}
