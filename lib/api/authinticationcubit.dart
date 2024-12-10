import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/assets/login/forgetpassword.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthStates> {
  static const String baseUrl =
      'https://innovahub-d3etetfzh6ada8aq.uaenorth-01.azurewebsites.net/api/Account';
  static const String registerApi = '$baseUrl/register';
  static const String loginApi = '$baseUrl/login';
  static const String forgetPasswordApi =
      'https://innovahub-d3etetfzh6ada8aq.uaenorth-01.azurewebsites.net/api/Profile/generate-token';
  static const String resetPasswordApi = '$baseUrl/reset-password';

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
          'Content-Type': 'application/json',
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
        emit(RegisterSuccessState());
      } else {
        final errorResponse = jsonDecode(response.body);
        emit(RegisterFailedState(
            message: errorResponse['Message'] ?? 'Failed to register.'));
      }
    } catch (e) {
      emit(RegisterFailedState(message: 'Error: $e'));
    }
  }

  // Login
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      final response = await http.post(
        Uri.parse(loginApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['state'] == true) {
          emit(LoginSuccessState(
              Message:
                  data['message'])); // Corrected parameter name to 'message'
        } else {
          emit(LoginFailedState(message: data['message']));
        }
      } else {
        emit(LoginFailedState(message: 'Login failed. Please try again.'));
      }
    } catch (e) {
      emit(LoginFailedState(
          message:
              'An error occurred: ${e.toString()}')); // Improved error message
    }
  }

// Function to send forget password request
  /* Future<void> forgetpassword(String email) async {
    final url = Uri.parse(forgetPasswordApi); // Replace with your API endpoint
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData.containsKey('token') &&
            responseData.containsKey('userId')) {
          final token = responseData['token'];
          final userId = responseData['userId'];

          // Handle token and userId (e.g., navigate to reset password screen)
          print('Token: $token');
          print('UserId: $userId');

          // You might want to navigate to a reset password screen and pass these values
          // Navigator.pushNamed(context, '/reset-password', arguments: {'token': token, 'userId': userId});
        } else {
          print('Invalid response format.');
        }
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }*/

// Example usage

  /* Future<void> verifyCode({required String code}) async {
    emit(VerificationLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "code": code,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(VerificationSuccessState(message: data['message']));
      } else {
        final errorResponse = jsonDecode(response.body);
        emit(VerificationFailedState(
            message: errorResponse['message'] ?? 'Verification failed.'));
      }
    } catch (e) {
      emit(VerificationFailedState(message: 'Error: $e'));
    }
  }*/

  // Reset Password
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoadingState());

    try {
      final response = await http.post(
        Uri.parse(resetPasswordApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(ResetPasswordSuccessState(message: data['message']));
      } else {
        final errorResponse = jsonDecode(response.body);
        emit(ResetPasswordFailedState(
            message: errorResponse['message'] ?? 'Failed to reset password.'));
      }
    } catch (e) {
      emit(ResetPasswordFailedState(message: 'Error: $e'));
    }
  }
}
