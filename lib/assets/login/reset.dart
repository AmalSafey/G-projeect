import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class resetpassword extends StatelessWidget {
  static String routname = "reset_password";

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Logic for resetting the password
  Future<void> resetPassword(BuildContext context, String userId, String token,
      String password) async {
    final url = Uri.parse(
        'https://innova-hub.premiumasp.net/api/Profile/reset-password'); // Replace with your API endpoint
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'token': token,
          'newPassword': password,
        }),
      );

      // Close the loading indicator
      Navigator.pop(context);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password reset successfully!'),
        ));
        Navigator.popUntil(
            context, ModalRoute.withName('/login')); // Navigate back to login
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to reset password. Please try again.'),
        ));
      }
    } catch (error) {
      // Close the loading indicator
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred: $error'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract arguments passed from the forget password screen
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final token = arguments['token'];
    final userId = arguments['userId'];

    // Pre-fill userId and token in text fields
    userIdController.text = userId;
    tokenController.text = token;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display userId
            TextField(
              controller: userIdController,
              decoration: InputDecoration(
                labelText: "User ID",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              readOnly: true, // Make the field read-only
            ),
            SizedBox(height: 20),
            // Display token
            TextField(
              controller: tokenController,
              decoration: InputDecoration(
                labelText: "Token",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.security),
              ),
              readOnly: true, // Make the field read-only
            ),
            SizedBox(height: 20),
            // New Password Input
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Confirm Password Input
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPassword = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();

                if (newPassword.isEmpty || confirmPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter all fields.'),
                  ));
                  return;
                }

                if (newPassword != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Passwords do not match.'),
                  ));
                  return;
                }

                resetPassword(context, userId, token, newPassword);
              },
              child: Text("Reset Password"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
