import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthStates> {
  static const String baseUrl = 'https://:7151/api/Account';
  static const String registerApi = '$baseUrl/register';
  static const String loginApi = '$baseUrl/login';

  AuthCubit() : super(AuthInitialState());

  // Register
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String city,
    required String country,
    required String district,
    required String phoneNumber,
    required String roleId,
  }) async {
    emit(LoadingInitialState());

    try {
      final response = await http.post(
        Uri.parse(registerApi),
        headers: {
          'Content-Type': 'application/json', // Set content type to JSON
        },
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "city": city,
          "phoneNumber": phoneNumber,
          "district": district,
          "country": country,
          "roleId": roleId,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RegisterSuccessState()); // Emit success state
      } else {
        var errorResponse = jsonDecode(response.body);
        emit(RegisterFailedState(
            message: errorResponse['Message'] ??
                'Failed to register.')); // Emit error state
      }
    } catch (e) {
      emit(RegisterFailedState(
          message: 'Error: $e')); // Emit error state on exception
    }
  }
}
