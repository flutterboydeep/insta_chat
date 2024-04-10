// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'insta_bloc.dart';

// ignore: must_be_immutable
class InstaState extends Equatable {
  bool circularIndicator;
  bool showVerifybutton;
  bool isShowEye;
  bool isSwitch;
  InstaState(
      {this.circularIndicator = false,
      this.showVerifybutton = false,
      this.isShowEye = false,
      this.isSwitch = false});

  InstaState copyWith(
      {bool? circularIndicator,
      bool? showVerifybutton,
      bool? isShowEye,
      bool? isSwitch}) {
    return InstaState(
      circularIndicator: circularIndicator ?? this.circularIndicator,
      showVerifybutton: showVerifybutton ?? this.showVerifybutton,
      isShowEye: isShowEye ?? this.isShowEye,
      isSwitch: isSwitch ?? this.isSwitch,
    );
  }

  List<Object?> get props =>
      [circularIndicator, showVerifybutton, isShowEye, isSwitch];
}

// // final class InstaInitial extends InstaState {}

// part of 'widget_bloc.dart';

// class InitialState extends Equatable {
//   bool isSwitch;
//   double slider;
//   InitialState({this.isSwitch = false, this.slider = 1.0});

//   InitialState copyWith({bool? isSwitch, double? slider}) {
//     return InitialState(
//       isSwitch: isSwitch ?? this.isSwitch,
//       slider: slider ?? this.slider,
//     );
//   }

//   @override
//   List<Object?> get props => [isSwitch, slider];
// }
