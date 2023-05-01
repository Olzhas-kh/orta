import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';


class TextFieldInputName extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  
  const TextFieldInputName({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:  const TextStyle(color: Colors.black),
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: "",
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
               borderSide:  BorderSide(color: Styles.blueAppColor, width: 1.5),
              ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
