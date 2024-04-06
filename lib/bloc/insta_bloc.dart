import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  InstaBloc() : super(InstaState()) {
    on<onDarkEvent>(_onDarkEvent);
    // on<InstaEvent>((event, emit) {

    // });
  }
  // onDarkEvent(event,emit){

  // }

  _onDarkEvent(onDarkEvent event, Emitter<InstaState> emit) {
    emit(state.copyWith(isDarkTheme: event.isDark));
  }
}
