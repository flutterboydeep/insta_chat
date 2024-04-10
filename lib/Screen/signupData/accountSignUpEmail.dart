import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:insta/Screen/signupData/signuuPhone.dart';
import 'package:insta/bloc/insta_bloc.dart';

import 'package:insta/utils/colors.dart';
import 'package:insta/widgest/passTextFiled.dart';

import 'package:insta/widgest/widgets.dart';

class AccountSignUp extends StatelessWidget {
  final String verifidInfo;

  AccountSignUp({
    super.key,
    required this.verifidInfo,
  });
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController repassCtrl = TextEditingController();
  TextEditingController bioCtrl = TextEditingController();

  // TextEditingController passCtrl = TextEditingController();
  // var inputDecoration =
  //       OutlineInputBorder(borderSide: Divider.createBorderSide(context));

  @override
  Widget build(BuildContext context) {
    log("I am accountSignUpEmail rebuilding");
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
                // SizedBox(
                //   height: 20,
                // ),

                Stack(
                  children: [
                    CircleAvatar(
                      minRadius: 60,
                      maxRadius: 80,
                      backgroundColor: Color.fromARGB(255, 207, 204, 204),
                      backgroundImage: AssetImage(
                        "lib/asets/images/emptyPerson.png",
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: FloatingActionButton.small(
                            elevation: null,
                            child: Icon(Icons.camera_alt_rounded),
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Text(
                //   "instagram",
                //   style: Theme.of(context).textTheme.titleLarge,
                // ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxnum: 50,
                    textEditingController: userNameCtrl,
                    hintText: "Username",
                    textInputType: TextInputType.name),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    readOnly: true,
                    // TextFieldEnable: false,
                    maxnum: 16,
                    textEditingController: emailCtrl,
                    hintText: verifidInfo,
                    // hintText: verifidInfo,
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<InstaBloc, InstaState>(
                    buildWhen: (previous, current) =>
                        previous.isShowEye != current.isShowEye,
                    builder: (context, state) {
                      return TextFieldWidget(
                          suffixWidget: IconButton(
                            icon: state.isShowEye
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              if (state.isShowEye == true) {
                                context
                                    .read<InstaBloc>()
                                    .add(EyeEvent(isShowEye: false));
                              } else {
                                context
                                    .read<InstaBloc>()
                                    .add(EyeEvent(isShowEye: true));
                              }
                            },
                          ),
                          maxnum: 16,
                          textEditingController: passCtrl,
                          hintText: "Enter Password",
                          ispass: !state.isShowEye,
                          // ispass: !state.isShowEye,
                          textInputType: TextInputType.text);
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxnum: 16,
                    textEditingController: repassCtrl,
                    hintText: " Re-enter Password",
                    ispass: true,
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxnum: 16,
                    textEditingController: bioCtrl,
                    hintText: "Enter bio",
                    textInputType: TextInputType.text),
                const SizedBox(
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
                      "Sign in",
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
                    backgroundColor: Theme.of(context).colorScheme.background,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPhoneOtp()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
