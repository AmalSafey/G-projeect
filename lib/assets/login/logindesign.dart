import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/forgetpassword.dart';
import 'package:flutter_application_graduation/assets/login/lofinbyfacebook.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';

class Logindesign extends StatelessWidget {
  static String routname = "Login";
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final passsword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          title: Text(
            'Log in',
            style: TextStyle(
                color: maincolor, fontSize: 24, fontWeight: FontWeight.bold),
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
                          "Welcome Back",
                          style: TextStyle(
                              color: maincolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Sign in to  your account",
                          style: TextStyle(
                            color: maincolor,
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildTextFormField(email, "Email", "Enter Your Email",
                          isEmail: true, obscureText: false),
                      SizedBox(
                        height: 20,
                      ),
                      _buildTextFormField(
                          passsword, "PassWord", "Enter Your Pass Word",
                          isPassword: true, obscureText: true),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validateForm();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 13.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, forgetpassword.routname);
                          },
                          child: Text("Forget PassWord",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 112, 182, 182))),
                        ),
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Donnot have an account ? ",
                            style: TextStyle(
                              fontSize: 15,
                              color: maincolor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RegisterDesign.routeName);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 20,
                                color: maincolor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          'Or Login In With',
                          style: TextStyle(color: maincolor, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},

                            icon: Icon(Icons.add), // إضافة أيقونة Google
                            iconSize: 30,
                            //color: Colors.blue,
                            // color: Colors.teal,
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          IconButton(
                            onPressed: () {},

                            icon: Icon(Icons.facebook),
                            iconSize: 35,
                            color: Colors.blue,
                            // color: Colors.teal,
                          ),
                          const Text(
                            'Facebook',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ])))));
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {}
  }
}

Widget _buildTextFormField(
    TextEditingController controller, String label, String hint,
    {bool obscureText = false,
    bool isName = false,
    bool isEmail = false,
    bool isPassword = false}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14), // تقليل المسافة داخل الـ TextField
        labelText: label,
        labelStyle: TextStyle(color: maincolor, fontSize: 15),
        hintText: hint,
        hintStyle: TextStyle(
          color: maincolor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: maincolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: maincolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }

        if (isEmail &&
            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)) {
          return 'Please enter your valid email';
        }
        if (isPassword && value.length < 8) {
          return 'password must be at least 8 chars';
        }
      },
    ),
  );
}
