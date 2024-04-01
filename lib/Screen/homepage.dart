import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:insta_chat/bloc/insta_bloc.dart';

class Homepage extends StatefulWidget {
  State<StatefulWidget> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instgram"),
        ),
        body: Center(
          child: Column(
            children: [
              Card(
                  // color: Colors.green,
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Center(child: Text("Hello How are you")))),
              Text("My name is Deepanshu choudhary ",
                  style: TextStyle(fontSize: 25, color: Colors.blue)),
              BlocBuilder<InstaBloc, InstaState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isDarkTheme,
                    onChanged: (newValue) {
                      context
                          .read<InstaBloc>()
                          .add(onDarkEvent(isDark: newValue));
                    },
                  );
                },
              ),
              BlocBuilder<InstaBloc, InstaState>(
                builder: (context, state) {
                  return Text("Value is = ${state.isDarkTheme}");
                },
              )
            ],
          ),
        ));
  }
}
