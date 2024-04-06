import 'package:flutter/material.dart';

import 'package:insta/Screen/signupData/signuuPhone.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgest/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          // height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    "lib/asets/images/insta-logo.png",
                  ),
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                ),
                CircleAvatar(
                  minRadius: 60,
                  maxRadius: 80,
                  backgroundColor: Color.fromARGB(255, 207, 204, 204),
                  backgroundImage: AssetImage(
                    "lib/asets/images/emptyPerson.png",
                  ),
                ),
                Text(
                  "instagram",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxnum: 50,
                    textEditingController: emailCtrl,
                    hintText: "Enter Username or E-mail",
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxnum: 16,
                    textEditingController: passCtrl,
                    hintText: "Enter Password",
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
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Create new account",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPhoneOtp()));
                    },
                  ),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(
                  //       Color.fromARGB(0, 125, 63, 63),
                  //     ),
                  //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //         side: BorderSide(
                  //           color: blueColor,
                  //           width: 2,
                  //         ),
                  //         borderRadius: BorderRadius.circular(20))),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => SignUpPhoneOtp()));
                  //   },
                  //   child: Text(
                  //     "Create new account",
                  //     style: TextStyle(
                  //         fontFamily: 'nono', color: blueColor, fontSize: 20),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
