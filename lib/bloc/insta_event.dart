// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'insta_bloc.dart';

abstract class InstaEvent {
  InstaEvent();
  List<Object?> get props => [];
}

class CircularIndicatorEvent extends InstaEvent {}

class ShowVerifybuttonEvent extends InstaEvent {
  bool isShowVerify;
  ShowVerifybuttonEvent({
    required this.isShowVerify,
  });
}

class EyeEvent extends InstaEvent {
  bool isShowEye;
  EyeEvent({
    required this.isShowEye,
  });
}

class SigningEvent extends InstaEvent {
  final String username;
  final String email;
  final String password;
  final String bio;
  SigningEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.bio,
  });
}
