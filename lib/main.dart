import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_chat/Screen/homepage.dart';
import 'package:insta_chat/Screen/login.dart';
import 'package:insta_chat/bloc/insta_bloc.dart';
import 'package:insta_chat/responsive/mobile_res_layout.dart';
import 'package:insta_chat/responsive/responsiveLayoutScreen.dart';
import 'package:insta_chat/responsive/web_res_layout.dart';
import 'package:insta_chat/utils/colors.dart';
import 'package:insta_chat/utils/dimensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InstaBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: BlocBuilder<InstaBloc, InstaState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'InstagramApp',
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),

            theme: ThemeData.dark(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: mobileBackgroundColor,
            ),
            // home: ResponsiveLayout(
            //   mobileScreenlayout: MobileScreenLayout(),
            //   webScreenlayout: WebScreenLayout(),
            // ),
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
