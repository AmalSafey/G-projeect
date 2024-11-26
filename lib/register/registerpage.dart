import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/assets/const.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static const String routeName = 'register_page'; // routeName of this screen:

  @override
  State<RegisterPage> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  String firstName = ''; // To store in it the name of the user that entered:

  String lastName = '';

  String userName = '';

  String email = '';

  String password = '';

  var formKey = GlobalKey<FormState>(); // key => to acess the form:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      body: Form(
        // To validate user input:

        key: formKey, // key of form:
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome To Innova",
                style: TextStyle(
                    color: maincolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Your Full Name',
                ),

                // value => this value that user entered:
                onChanged: (value) {
                  firstName = value;
                },

                // To validate user input:
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    // if user not enter data:

                    return 'Please enter your first name'; // not valid:
                  }

                  return null; // is valid:
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),

                // value => this value that user entered:
                onChanged: (value) {
                  lastName = value;
                },

                // To validate user input:
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    // if user not enter data:

                    return 'Please enter your last name'; // not valid:
                  }

                  return null; // is valid:
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'user Name'),

                // value => this value that user entered:
                onChanged: (value) {
                  userName = value;
                },

                // To validate user input:
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    // if user not enter data:

                    return 'Please enter your user name'; // not valid:
                  }

                  return null; // is valid:
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),

                // value => this value that user entered:
                onChanged: (value) {
                  email = value;
                },

                // To validate user input:
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);

                  if (value == null || value.trim().isEmpty) {
                    // if user not enter data:

                    return 'Please enter your email'; // not valid:
                  }

                  if (!emailValid) {
                    // if email not valid:

                    return ('Please enter your valid email'); // disply this String:
                  }

                  return null; // is valid:
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),

                // value => this value that user entered:
                onChanged: (value) {
                  password = value;
                },

                // To validate user input:
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    // if user not enter data:

                    return 'Please enter your password'; // not valid:
                  }

                  if (value.length < 6) {
                    return 'password must be at least 6 chars';
                  }

                  return null; // is valid:
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // validate:

                  validateForm();
                },
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (formKey.currentState!.validate() == true) {
      // register:
    }
  }
}
