// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailChanged;
  final String passwordChanged;
  SignInTextChangedEvent({
    required this.emailChanged,
    required this.passwordChanged,
  });
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent({
    required this.email,
    required this.password,
  });
}
