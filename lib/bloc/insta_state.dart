// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'insta_bloc.dart';

class InstaState extends Equatable {
  bool isDarkTheme;
  InstaState({
    this.isDarkTheme = false,
  });

  InstaState copyWith({bool? isDarkTheme}) {
    return InstaState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  List<Object?> get props => [isDarkTheme];
}

// final class InstaInitial extends InstaState {}
