import 'package:flutter/material.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoadingInitialState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailedState extends AuthStates {
  final String message;

  RegisterFailedState({required this.message});
}

class loginloadingstate extends AuthStates {}

class loginsuccessstate extends AuthStates {}

class loginfaildstate extends AuthStates {
  String message;
  loginfaildstate({required this.message});
}
