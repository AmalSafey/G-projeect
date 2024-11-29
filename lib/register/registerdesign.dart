import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';
import 'package:flutter_application_graduation/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_graduation/customwidgid/textfieldwidged.dart';

class RegisterDesign extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterDesign> createState() => _RegisterDesignState();
}

class _RegisterDesignState extends State<RegisterDesign> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirm = true;
  String? selectedRole;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 10),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: maincolor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Welcome To Innova App",
                          style: TextStyle(
                            color: maincolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Start Your journey now!",
                          style: TextStyle(
                            color: maincolor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        controller: firstnameController,
                        label: 'First Name',
                        hint: 'Enter Your First Name',
                        isFirstName: true,
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: lastnameController,
                        label: 'Last Name',
                        hint: 'Enter Your Last Name',
                        isLastName: true,
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: emailController,
                        label: 'Email',
                        hint: 'Enter Your Email',
                        isEmail: true,
                      ),
                      const SizedBox(height: 15),
                      buildPasswordField(passwordController, "Password"),
                      const SizedBox(height: 15),
                      buildPasswordField(
                          confirmPasswordController, "Confirm Password",
                          isConfirm: true),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: phoneNumberController,
                        label: 'Phone Number',
                        hint: 'Enter Your Phone Number',
                        isPhone: true,
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: countryController,
                        label: 'Country',
                        hint: 'Enter Your Country',
                        isCountry: true,
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: cityController,
                        label: 'City',
                        hint: 'Enter Your City',
                        isCity: true,
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: districtController,
                        label: 'District',
                        hint: 'Enter Your District',
                        isDistrict: true,
                      ),
                      const SizedBox(height: 15),
                      buildRoleDropdown(),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).register(
                                firstName: firstnameController.text,
                                lastName: lastnameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                city: cityController.text,
                                country: countryController.text,
                                district: districtController.text,
                                phoneNumber: phoneNumberController.text,
                                roleId: selectedRole!,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text(
                            state is LoadingInitialState
                                ? "Loading..."
                                : 'Create Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildLoginRow(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homescreen()),
            );
          } else if (state is RegisterFailedState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text(
                        state.message,
                        style: TextStyle(color: maincolor),
                      ),
                      backgroundColor: Colors.white,
                    ));
          }
        },
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller, String label,
      {bool isConfirm = false}) {
    bool isObscure = isConfirm ? isObscureConfirm : isObscurePassword;
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        hintText: "Please Enter $label",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFFB2B1B1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: maincolor),
        ),
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              if (isConfirm) {
                isObscureConfirm = !isObscureConfirm;
              } else {
                isObscurePassword = !isObscurePassword;
              }
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        if (isConfirm && value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget buildRoleDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField<String>(
        value: selectedRole,
        decoration: InputDecoration(
          labelText: "Select Role",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: maincolor),
          ),
        ),
        items: ["User", "Investor", "Owner"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedRole = value;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Please select a role';
          }
          return null;
        },
      ),
    );
  }

  Widget buildLoginRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            color: maincolor,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Logindesign.routname);
          },
          child: const Text(
            "Log In",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 63, 154, 152),
            ),
          ),
        ),
      ],
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/apibase.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';
import 'package:flutter_application_graduation/assets/profile/profil.dart';
import 'package:flutter_application_graduation/customwidgid/textfieldwidged.dart';

class registerdesign extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<registerdesign> createState() => _RegisterDesignState();
}

class _RegisterDesignState extends State<registerdesign> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isObscurepassword = true;
  bool isObscureconfirm = true;
  String? selectedRole;
  bool isLoading = false;
  String? errorMessage;

  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService(); // Instance of AuthService

  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      try {
        await _authService.register(
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          city: cityController.text,
          country: countryController.text,
          district: districtController.text,
          phoneNumber: phoneNumberController.text,
          // roleid: '84cfb1b6-de20-4b01-a39c-e34dcd708bd3',
          roleId: '',
        );

        setState(() {
          isLoading = false;
        });

        // Navigate to the profile screen on success
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => profiledesign(
              firstnameController: firstnameController.text,
              lastnameController: lastnameController.text,
              emailController: emailController.text,
              passwordController: passwordController.text,
              cityController: cityController.text,
              phoneNumber: phoneNumberController.text,
            ),
          ),
        );
      } catch (e) {
        setState(() {
          isLoading = false;
          errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 10),
            Text(
              'Sign Up',
              style: TextStyle(
                  color: maincolor, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Welcome To Innova App",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Start Your journey now!",
                    style: TextStyle(
                      color: maincolor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: firstnameController,
                  label: 'First Name',
                  hint: 'Enter Your First Name',
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: lastnameController,
                  label: 'Last Name',
                  hint: 'Enter Your Last Name',
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: emailController,
                  label: 'Email',
                  hint: 'Enter Your Email',
                  isEmail: true,
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: passwordController,
                  label: 'Password',
                  hint: 'Enter Your Password',
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: confirmPasswordController,
                  label: 'Confirm Password',
                  hint: 'Confirm Your Password',
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: phoneNumberController,
                  label: 'Phone Number',
                  hint: 'Enter Your Phone Number',
                  isPhone: true,
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: countryController,
                  label: 'Country',
                  hint: 'Enter Your Country',
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: cityController,
                  label: 'City',
                  hint: 'Enter Your City',
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  controller: districtController,
                  label: 'District',
                  hint: 'Enter Your District',
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Select Role",
                      suffixIcon: DropdownButton<String>(
                        items: ["User", "Investor", "Owner"]
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                        },
                        underline: SizedBox(),
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: maincolor),
                      ),
                    ),
                    controller: TextEditingController(text: selectedRole),
                  ),
                ),
                const SizedBox(height: 20),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.black),
                  ),
                const SizedBox(height: 10),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _validateAndSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: maincolor,
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
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 63, 154, 152),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/