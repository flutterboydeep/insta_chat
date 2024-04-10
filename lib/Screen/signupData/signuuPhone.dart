import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta/Screen/signupData/signUpEmail.dart';
import 'package:insta/bloc/insta_bloc.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgest/widgets.dart';

class SignUpPhoneOtp extends StatelessWidget {
  SignUpPhoneOtp({super.key});
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black,
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
                Text("What's mobile number?",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the mobile number where you can be contacted. No one will see this on your profile",
                  // style: Theme.of(context).textTheme.titleMedium),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    textEditingController: emailCtrl,
                    hintText: "Mobile number",
                    filled: false,
                    textInputType: TextInputType.number),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'you may receive SMS notifications from us for security and login purposes.',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Next",
                    onPress: () {},
                    backgroundColor: blueColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                    text: "Or using E-mail",
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    }),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(hintText: 'Enter OTP'),
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
