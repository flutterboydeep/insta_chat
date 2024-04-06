import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgest/widgets.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: null,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          // height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("What's your email?",
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                    "Enter the email where you can be contacted. No one will see this on your profile",
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWidget(
                    textEditingController: emailCtrl,
                    hintText: "Enter E-mail",
                    maxnum: 50,
                    filled: true,
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Next",
                      backgroundColor: blueColor,
                      onPressed: () {},
                    )),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Enter 6 digt code'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(blueColor)),
                  onPressed: () {},
                  child: Text(
                    "Verify",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
