import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';

class registerdesign extends StatefulWidget {
  @override
  State<registerdesign> createState() => _registerdesignState();

  static const String routteName =
      'register_screen'; // routeName of this screen:
}

class _registerdesignState extends State<registerdesign> {
  String? selectedRole;
  bool isvalidated = true;
  final fullname = TextEditingController();

  final email = TextEditingController();

  final address = TextEditingController();

  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: Color.fromARGB(255, 112, 182, 182),
              fontSize: 24,
              fontWeight: FontWeight.bold),
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
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Welcome To Innova",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Create Your account",
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 15,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildTextFormField(fullname, "Name", "Enter Your Full Name",
                    isName: true, obscureText: false),
                SizedBox(
                  height: 15,
                ),
                _buildTextFormField(email, "Email", "Enter Your Email",
                    isEmail: true, obscureText: false),
                SizedBox(
                  height: 15,
                ),
                _buildTextFormField(
                  address,
                  "City",
                  "Enter Your City",
                ),
                SizedBox(
                  height: 15,
                ),
                _buildTextFormField(password, "Password", "Enter Your Password",
                    obscureText: true, isPassword: true),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Select Role",
                      labelStyle: const TextStyle(
                          color: Color(0xFF333333), fontSize: 15),
                      hintText: "Choose one",
                      suffixIcon: DropdownButton<String>(
                        items:
                            ["User", "Investor", "Owner"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                            isvalidated = true;
                          });
                        },
                        underline: SizedBox(), // Removes the default underline
                        icon:
                            Icon(Icons.arrow_drop_down), // Dropdown arrow icon
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Color(0xFFB2B1B1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Color(0xFFB2B1B1)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFB2B1B1)),
                      ),
                    ),
                    controller: TextEditingController(text: selectedRole),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a role';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      validateForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 63, 154, 152),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 13.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Logindesign.routname);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 112, 182, 182),
                        ),
                      ),
                    ),
                    /*
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                    */
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                const Center(
                  child: Text(
                    'Or Sign In With',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 182, 182),
                    ),
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
                      // cor: Colors.red,
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
                      //color: Colors.red,
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
              ],
            ),
          ),
        ),
      ),
    );
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
        if (isName && !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Please enter a valid name (letters only)';
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

/*Widget _buildContainer(String text) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 63, 154, 152),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ]);
}*/
/*Widget _buildContainer(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 63, 154, 152),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}*/