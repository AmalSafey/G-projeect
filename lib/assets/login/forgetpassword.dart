import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_graduation/assets/login/reset.dart';

class forgetpassword extends StatelessWidget {
  static String routname = "forget_password";
  final TextEditingController emailController = TextEditingController();

  // Logic for sending forget password request
  Future<void> sendForgetPasswordRequest(
      BuildContext context, String email) async {
    final url = Uri.parse(
        'https://innovahub-d3etetfzh6ada8aq.uaenorth-01.azurewebsites.net/api/Profile/generate-token'); // Replace with your API endpoint
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
        body: jsonEncode({'email': email}),
      );

      // Close the loading indicator
      Navigator.pop(context);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData.containsKey('token') &&
            responseData.containsKey('userId')) {
          final token = responseData['token'];
          final userId = responseData['userId'];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Reset link sent successfully to $email!'),
          ));
          // Navigate to the reset password screen with token, userId, and email
          Navigator.pushNamed(
            context,
            resetpassword.routname,
            arguments: {
              'token': token,
              'userId': userId,
              'email': email,
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Invalid response from the server.'),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to send reset link. Please try again.'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Enter your email to reset password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            // Email Input Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                if (email.isNotEmpty) {
                  sendForgetPasswordRequest(context, email);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter your email.'),
                  ));
                }
              },
              child: Text("Send Reset Link"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to login screen
                },
                child: Text(
                  "Back to Login",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
