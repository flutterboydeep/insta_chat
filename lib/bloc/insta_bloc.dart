import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  InstaBloc() : super(InstaState()) {
    on<CircularIndicatorEvent>(_circularIndicatorEvent);
    on<ShowVerifybuttonEvent>(showVerifybuttonEvent);
    on<EyeEvent>(_eyeEvent);
    // on<SwicthEvent>(_switchEvent);
  }

  void _circularIndicatorEvent(
      CircularIndicatorEvent event, Emitter<InstaState> emit) {
    emit(state.copyWith(circularIndicator: !state.circularIndicator));
  }

  void showVerifybuttonEvent(
      ShowVerifybuttonEvent event, Emitter<InstaState> emit) {
    emit(state.copyWith(showVerifybutton: event.isShowVerify));
  }

  void _eyeEvent(EyeEvent event, Emitter<InstaState> emit) {
    emit(state.copyWith(isShowEye: event.isShowEye));
  }
}

// import 'package:flutter_bloc/flutter_bloc.dart';


// part 'widget_event.dart';
// part 'widget_state.dart';

// class WidgetBloc extends Bloc<WidgetEvent, InitialState> {
//   WidgetBloc() : super(InitialState()) {
//     on<OnOffNotificationEvent>(_onOffNotificationEvent);
//     on<SliderEvent>(_sliderEvent);
//   }

//   void _onOffNotificationEvent(
//       OnOffNotificationEvent event, Emitter<InitialState> emit) {
//     emit(state.copyWith(isSwitch: !state.isSwitch));
//   }

//   void _sliderEvent(SliderEvent event, Emitter<InitialState> emit) {
//     emit(state.copyWith(slider: event.sliderValue));
//     // emit(state.copyWith(slider: ));
//   }
// }
