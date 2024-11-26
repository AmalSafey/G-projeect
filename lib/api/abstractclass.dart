abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoadingInitialState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailedState extends AuthStates {
  final String message;

  RegisterFailedState({required this.message});
}
