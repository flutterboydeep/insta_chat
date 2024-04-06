import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta/Screen/login.dart';
import 'package:insta/bloc/insta_bloc.dart';
import 'package:insta/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyD7MZydj3VCkL8S-Lu_JTSMeJpY5Ej3UPI',
          appId: '1:1052961703755:web:849b19eb7a6efa11df8ace',
          messagingSenderId: '1052961703755',
          projectId: 'insta-e365c',
          storageBucket: 'insta-e365c.appspot.com'),
    );
  }
  await Firebase.initializeApp();
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

            theme: ThemeData.dark(
              // brightness: Brightness.light,
              useMaterial3: true,
            ).copyWith(

                // scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontSize: 18,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.bold),
              titleLarge: TextStyle(
                  fontSize: 35,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.bold),
              titleMedium: TextStyle(
                fontSize: 18,
                fontFamily: 'noto',
              ),
              titleSmall: TextStyle(
                fontSize: 15,
                fontFamily: 'noto',
              ),
            )),
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
