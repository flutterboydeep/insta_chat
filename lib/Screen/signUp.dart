import 'package:flutter/material.dart';
import 'package:insta_chat/utils/colors.dart';
import 'package:insta_chat/widgets.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: null,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          // height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Text(
                "Instagram",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 100,
              ),
              TextFieldWidget(
                  textEditingController: emailCtrl,
                  hintText: "Enter Your E-mail",
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  textEditingController: passCtrl,
                  hintText: "Enter Your Password",
                  ispass: true,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(blueColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  onPressed: () {},
                  child: Text("Sign Up"),
                ),
              ),
              Flexible(child: Container(), flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
