import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;

  String? Function(String?)? validator;
  TextEditingController? controller;

  DefaultTextFormField(
      {required this.hintText, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      validator: validator,
    );
  }
}
