import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta/Screen/signupData/accountSignUpEmail.dart';
import 'package:insta/bloc/insta_bloc.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgest/widgets.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController emailCtrl = TextEditingController();

  TextEditingController emailOtpCtrl = TextEditingController();

  EmailOTP obj = new EmailOTP();

  bool showVerifybutton = false;

  // @override
  @override
  Widget build(BuildContext context) {
    log("I singupEmail is rebuilding again");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<InstaBloc>(context)
                  .add(ShowVerifybuttonEvent(isShowVerify: false));
              Navigator.of(context).pop();
            },
          ),
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
                    filled: true,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<InstaBloc, InstaState>(
                  buildWhen: (previous, current) =>
                      previous.circularIndicator != current.circularIndicator,
                  builder: (context, state) {
                    return state.circularIndicator
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              text: "Next",
                              backgroundColor: blueColor,
                              onPress: () {
                                if (emailCtrl.text.isEmpty) {
                                  bottomMessage(context, "Please Enter Email",
                                      errorMessageColor);
                                } else if (!emailCtrl.text.contains("@")) {
                                  bottomMessage(context, "Email is not vaild",
                                      errorMessageColor);
                                } else {
                                  BlocProvider.of<InstaBloc>(context)
                                      .add(CircularIndicatorEvent());
                                  sendOtpmail(
                                      context, emailCtrl.text.toString());
                                }
                              },
                            ),
                          );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: BlocBuilder<InstaBloc, InstaState>(
                      buildWhen: (previous, current) =>
                          previous.showVerifybutton != current.showVerifybutton,
                      builder: (context, state) {
                        return state.showVerifybutton
                            ? TextField(
                                controller: emailOtpCtrl,

                                // tex: emailOtpCtrl,
                                decoration: InputDecoration(
                                    hintText: 'Enter 6 digt code'),
                              )
                            : SizedBox();
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: BlocBuilder<InstaBloc, InstaState>(
                  buildWhen: (previous, current) =>
                      previous.showVerifybutton != current.showVerifybutton,
                  builder: (context, state) {
                    return state.showVerifybutton
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(blueColor)),
                            onPressed: () {
                              verifyOtpmail(context, emailCtrl.text.toString(),
                                  emailOtpCtrl.text.toString());
                            },
                            child: Text(
                              "Verify",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          )
                        : SizedBox();
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // EmailAuth emailAuth = new EmailAuth(sessionName: "Verify your E-mai");
  void sendOtpmail(context, String mail) async {
    //  EmailAuth.SessionName="Verify your E-mai";

    try {
      obj.setConfig(
        appEmail: "panwardeepansu@gmail.com",
        appName: "Insta",
        userEmail: mail,
        otpLength: 6,
        otpType: OTPType.digitsOnly,
      );
      // obj.setSMTP(
      //     host: "smtp.rohitchouhan.com",
      //     auth: true,
      //     username: "Deepanshu",
      //     password: "*************",
      //     secure: "TLS",
      //     port: 576);
      // bool res = await EmailAuth.sendOtp(recipientMail: mail, otpLength: 6);

      if (await obj.sendOTP() == true) {
        BlocProvider.of<InstaBloc>(context).add(CircularIndicatorEvent());

        log("send code successfully");
        bottomMessage(
            context, "Otp Send Successfully check MailBox", Colors.green);

        BlocProvider.of<InstaBloc>(context)
            .add(ShowVerifybuttonEvent(isShowVerify: true));
      } else {
        BlocProvider.of<InstaBloc>(context).add(CircularIndicatorEvent());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Some Error occured")));
        BlocProvider.of<InstaBloc>(context)
            .add(ShowVerifybuttonEvent(isShowVerify: false));
        // showVerifybutton = false;
      }
    } catch (e) {
      log("Error is $e");
    }
  }

  void verifyOtpmail(context, mail, mailOtp) {
    try {
      obj.setConfig(
        appEmail: "panwardeepansu@gmail.com",
        appName: "Insta",
        userEmail: mail,
        otpLength: 6,
        otpType: OTPType.digitsOnly,
      );

      log("The value of mailOtp is $mailOtp");
      if (obj.verifyOTP(otp: mailOtp) == true) {
        bottomMessage(
            context, "Your Email has been Verifed", successMessageColor);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AccountSignUp(
                      verifidInfo: mail,
                    )));
      } else {
        bottomMessage(context, "Wrong OTP try another", errorMessageColor);
      }
    } catch (e) {
      log("error this $e");
      print(e.toString());
    }
  }

  bottomMessage(context, mesaage, color) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text(mesaage)),
      backgroundColor: color,
    ));
  }
}
