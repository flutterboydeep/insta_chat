// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:insta/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool ispass;
  final String hintText;
  final TextInputType textInputType;
  final bool filled;
  final int maxnum;
  final bool readOnly;
  final Widget suffixWidget;

  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    this.ispass = false,
    required this.hintText,
    required this.textInputType,
    this.filled = true,
    this.maxnum = 10,
    this.readOnly = false,
    this.suffixWidget = const SizedBox(
      width: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      readOnly: readOnly,
      // style: TextStyle(),
      // textAlign: TextAlign.left,

      controller: textEditingController,
      decoration: InputDecoration(
        prefix: SizedBox(width: 13),
        suffixIcon: suffixWidget,
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: filled,
        contentPadding: const EdgeInsets.all(2),
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

  final VoidCallback onPress;

  const CustomButton({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.borderSideColor = blueColor,
    required this.text,
    required this.onPress,
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
        onPressed: onPress,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

// class BottomMessage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Otp not send "))));
//   }
// }
