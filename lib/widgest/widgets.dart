// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:insta/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool ispass;
  final String hintText;
  final TextInputType textInputType;
  final bool filled;
  final int maxnum;

  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    this.ispass = false,
    required this.hintText,
    required this.textInputType,
    this.filled = true,
    this.maxnum = 10,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      // style: TextStyle(),

      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: filled,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
      obscureText: ispass,
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderSideColor;

  final String text;

  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.borderSideColor = blueColor,
    required this.text,
    required this.onPressed,
  });

  //  CustomButton({
  //   super.key,
  //   required this.backgroundColor,

  //   required this.borderSideColor,
  //    required this.text,
  //   required this.onPressed}
  // );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: blueColor),
          )),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
