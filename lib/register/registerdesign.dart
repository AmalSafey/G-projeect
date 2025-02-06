import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';
import 'package:flutter_application_graduation/home/home.dart';
import 'package:flutter_application_graduation/screens/hometabscreen.dart';
import 'package:flutter_application_graduation/screens/ownerdetails.dart';
import 'package:flutter_application_graduation/screens/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDesign extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterDesign> createState() => _RegisterDesignState();
}

class _RegisterDesignState extends State<RegisterDesign> {
  // Controllers
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // State Variables
  bool isObscurePassword = true;
  bool isObscureConfirm = true;
  String? selectedRoleId;

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Roles for Dropdown
  final List<Map<String, String>> roles = [
    {"id": "ec1069f3-96e7-4874-bf09-f290b7ed3038", "name": "BusinessOwner"},
    {"id": "2d666651-3f2f-4d7e-b213-7686cfdc55af", "name": "Admin"},
    {"id": "cb4406e8-fdf1-4aa7-b1aa-dd90ef59d4f1", "name": "Investor"},
    {"id": "444ca529-58cc-4ca5-b746-19d3f47796e2", "name": "Customer"},
  ];

  // Method to show a dialog
  void _showDialog(BuildContext context, String message,
      {VoidCallback? onClose}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق الـ Dialog
              if (onClose != null) {
                onClose(); // تنفيذ الإجراء بعد إغلاق التنبيه
              }
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Color.fromARGB(255, 112, 182, 182),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        print("Current state: $state");

        if (state is RegisterSuccessState) {
          // Role-based navigation
          if (selectedRoleId == "ec1069f3-96e7-4874-bf09-f290b7ed3038") {
            // BusinessOwner
            Navigator.pushNamed(context, ownerdetails.routname);
          } else if (selectedRoleId == "ec1069f3-96e7-4874-bf09-f290b7ed3038") {
            // Investor
            Navigator.pushNamed(context, ownerdetails.routname);
          } else if (selectedRoleId == "444ca529-58cc-4ca5-b746-19d3f47796e2") {
            // Customer
            Navigator.pushNamed(context, hometabscreen.routname);
          } else {
            // Default or error handling (optional)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid role selected')),
            );
          }
          _showDialog(context, state.messagesuccess, onClose: () {
            Future.microtask(() {
              Navigator.pushReplacementNamed(context, homescreen.routname);
            });
          });
        } else if (state is RegisterFailedState) {
          print("Registration failed, staying on the same page.");

          _showDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sign Up'),
            backgroundColor: Color.fromARGB(255, 112, 182, 182),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Input Fields
                    _buildTextFormField(
                      controller: firstnameController,
                      label: 'First Name',
                      hint: 'Enter your first name',
                    ),
                    _buildTextFormField(
                      controller: lastnameController,
                      label: 'Last Name',
                      hint: 'Enter your last name',
                    ),
                    _buildTextFormField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                    ),
                    _buildPasswordFormField(
                      controller: passwordController,
                      label: 'Password',
                      obscureText: isObscurePassword,
                      onToggleVisibility: () {
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      },
                    ),
                    _buildPasswordFormField(
                      controller: confirmPasswordController,
                      label: 'Confirm Password',
                      obscureText: isObscureConfirm,
                      onToggleVisibility: () {
                        setState(() {
                          isObscureConfirm = !isObscureConfirm;
                        });
                      },
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    _buildTextFormField(
                      controller: cityController,
                      label: 'City',
                      hint: 'Enter your city',
                    ),
                    _buildTextFormField(
                      controller: phoneNumberController,
                      label: 'Phone Number',
                      hint: 'Enter your phone number',
                    ),

                    _buildTextFormField(
                      controller: districtController,
                      label: 'District',
                      hint: 'Enter your district',
                    ),
                    _buildTextFormField(
                      controller: countryController,
                      label: 'Country',
                      hint: 'Enter your country',
                    ),
                    // Dropdown for Roles
                    _buildDropdownField(),
                    SizedBox(height: 20),
                    // Submit Button
                    _buildSubmitButton(context, state),
                    SizedBox(height: 20),
                    // Navigation to Login
                    _buildLoginNavigation(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context, AuthStates state) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          // Call the register method from the AuthCubit
          await context.read<AuthCubit>().register(
                firstName: firstnameController.text,
                lastName: lastnameController.text,
                email: emailController.text,
                password: passwordController.text,
                confirmPassword: confirmPasswordController.text,
                city: cityController.text,
                country: countryController.text,
                district: districtController.text,
                phoneNumber: phoneNumberController.text,
                roleId: selectedRoleId!,
              );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 112, 182, 182),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(
        state is LoadingInitialState ? 'Loading...' : 'Create Account',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _buildLoginNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Logindesign.routname);
          },
          child: Text(
            "Log In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 112, 182, 182),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 112, 182, 182),
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontStyle: FontStyle.italic,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 239, 247, 247),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 182, 182),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 182, 182),
              width: 2.0,
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
        validator: validator ??
            (value) => value!.isEmpty ? 'Please enter your $label' : null,
      ),
    );
  }

  Widget _buildPasswordFormField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Enter your $label',
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 112, 182, 182),
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontStyle: FontStyle.italic,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 239, 247, 247),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 182, 182),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 182, 182),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color.fromARGB(255, 112, 182, 182),
            ),
            onPressed: onToggleVisibility,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
        validator: validator ??
            (value) => value!.isEmpty ? 'Please enter your $label' : null,
      ),
    );
  }

  Widget _buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: selectedRoleId,
        decoration: InputDecoration(
          labelText: "Select Role",
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 112, 182, 182),
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 239, 247, 247),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 182, 182),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 112, 182, 182),
              width: 2.0,
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
        items: roles.map((role) {
          return DropdownMenuItem<String>(
            value: role['id'],
            child: Text(role['name']!),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedRoleId = value;
          });
        },
        validator: (value) => value == null ? 'Please select a role' : null,
      ),
    );
  }
}
