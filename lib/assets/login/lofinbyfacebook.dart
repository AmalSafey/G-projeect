import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';

class Logindesignfacebook extends StatelessWidget {
  static String routname = "Loginfacebook";
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final passsword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Face book',
            style: TextStyle(
                color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        height: 45,
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
                        height: 35,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validateForm();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
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
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text("Forget PassWord ? ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue)),
                            ),
                          ]),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150, // Set the width of the line
                            child: Divider(
                              thickness: 2, // Line thickness
                              color: Colors.black, // Line color
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("or"),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 150, // Set the width of the line
                            child: Divider(
                              thickness: 2, // Line thickness
                              color: Colors.black, // Line color
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validateForm();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 13.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: const Text(
                            'Create New Account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                            ),
                          ),
                        ),
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
        labelStyle: const TextStyle(color: Color(0xFF333333), fontSize: 15),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF333333),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xFFB2B1B1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFFB2B1B1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFB2B1B1)),
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
