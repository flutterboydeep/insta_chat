part of 'insta_bloc.dart';

@immutable
sealed class InstaEvent {}

class onDarkEvent extends InstaEvent {
  final bool isDark;
  onDarkEvent({required this.isDark});
}
