import 'package:flutter/material.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoadingInitialState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final String messagesuccess;
  RegisterSuccessState({required this.messagesuccess});
}

class RegisterFailedState extends AuthStates {
  final String message;

  RegisterFailedState({required this.message});
}

class LoginSuccessState extends AuthStates {
  String Message;
  LoginSuccessState({required this.Message});
}

class LoginLoadingState extends AuthStates {}

class LoginFailedState extends AuthStates {
  String message;
  LoginFailedState({required this.message});
}

class ForgetPasswordLoadingState extends AuthStates {}

class ForgetPasswordSuccessState extends AuthStates {
  final String message;
  final String token;

  ForgetPasswordSuccessState({required this.message, required this.token});
}

class ForgetPasswordFailedState extends AuthStates {
  String message;
  ForgetPasswordFailedState({required this.message});
}

class ResetPasswordLoadingState extends AuthStates {}

class ResetPasswordSuccessState extends AuthStates {
  final String message;
  ResetPasswordSuccessState({required this.message});
}

class ResetPasswordFailedState extends AuthStates {
  final String message;
  ResetPasswordFailedState({required this.message});
}

// Verification States
class VerificationLoadingState extends AuthStates {}

class VerificationSuccessState extends AuthStates {
  final String message;
  VerificationSuccessState({required this.message});
}

class VerificationFailedState extends AuthStates {
  final String message;
  VerificationFailedState({required this.message});
}
