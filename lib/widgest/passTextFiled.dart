// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta/bloc/insta_bloc.dart';

class PassTextField extends StatelessWidget {
  PassTextField({super.key});
  TextEditingController pass = TextEditingController();
  // @override
  Widget build(BuildContext context) {
    log("I am passTextFileldno ");

    return BlocBuilder<InstaBloc, InstaState>(
      buildWhen: (previous, current) => previous.isShowEye != current.isShowEye,
      builder: (context, state) {
        return TextField(
            controller: pass,
            keyboardType: TextInputType.name,
            // obscureText: state.isShowEye ? false : true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2),
              // enabledBorder: inputDecoration,
              // focusedBorder: inputDecoration,
              hintText: "Enter Password",
              filled: true,
              prefix: SizedBox(
                width: 13,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    state.isShowEye ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  if (state.isShowEye) {
                    BlocProvider.of<InstaBloc>(context)
                        .add(EyeEvent(isShowEye: false));
                  } else {
                    // context
                    //     .read<InstaBloc>()
                    BlocProvider.of<InstaBloc>(context)
                        .add(EyeEvent(isShowEye: true));
                  }
                },
              ),
            ));
      },
    );
  }
}
