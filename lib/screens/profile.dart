/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/screens/privacyandsecurityforcustomer.dart';
import 'package:image_picker/image_picker.dart';

const Color maincolor = Color.fromARGB(255, 6, 122, 216); // لون رئيسي
const Color textcolor = Colors.black; // لون النصوص

class profile extends StatefulWidget {
  static String routeName = "profiledesign";
  final String firstnameController;
  final String lastnameController;
  final String emailController;
  final String passwordController;
  final String cityController;
  final String phoneNumber;
  final String role;

  const profile(
      {Key? key,
      required this.firstnameController,
      required this.lastnameController,
      required this.emailController,
      required this.passwordController,
      required this.cityController,
      required this.phoneNumber,
      required this.role})
      : super(key: key);

  @override
  State<profile> createState() => _ProfileDesignState();
}

class _ProfileDesignState extends State<profile> {
  File? _profileImage;

  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  late TextEditingController _roleController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _firstnameController =
        TextEditingController(text: widget.firstnameController);
    _lastnameController =
        TextEditingController(text: widget.lastnameController);
    _emailController = TextEditingController(text: widget.emailController);
    _passwordController =
        TextEditingController(text: widget.passwordController);
    _cityController = TextEditingController(text: widget.cityController);
    _phoneController = TextEditingController(text: widget.phoneNumber);
    _roleController = TextEditingController(text: widget.role);
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            // Profile Header
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('lib/assets/photo_5816892861919119516_y.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      backgroundColor: Colors.grey[200],
                      child: _profileImage == null
                          ? const Icon(Icons.person,
                              size: 60, color: Colors.grey)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.edit,
                            color: maincolor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // User Info Section
            Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.firstnameController} ${widget.lastnameController}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "ID : 12345678",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 89, 87, 87),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Profile Fields Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: _buildProfileField("Email  ", _emailController),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing;
                          });
                        },
                        icon: Icon(
                          _isEditing ? Icons.check : Icons.edit,
                          color: Colors.blue,
                        ),
                        iconSize: 25,
                      ),
                    ],
                  ),
                  _buildProfileField("Phone Number  ", _phoneController),
                  _buildProfileField("Discret   ", _phoneController),
                  _buildProfileField("City  ", _cityController),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.lock, color: Colors.blue),
                  title: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, privacyandsecurityforcustomer.routname);
                    },
                    child: Text(
                      " Privicy & Security",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Log out logic
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.payment, color: Colors.blue),
                  title: const Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Log out logic
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // جعل العناصر في المنتصف
                    children: [
                      Icon(Icons.login_outlined, color: Colors.blue),
                      const SizedBox(
                          width: 8), // إضافة مسافة بين الأيقونة والنص
                      const Text(
                        "Log Out",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Log out logic
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: _isEditing
          ? TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Text(
                    "$label: ${controller.text}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
    );
  }
}
*/
/*import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/screens/privacyandsecurityforcustomer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

const Color maincolor = Color.fromARGB(255, 6, 122, 216); // اللون الرئيسي
const Color textcolor = Colors.black; // لون النصوص

class profile extends StatefulWidget {
  static String routeName = "profiledesign";
  final String userId; // سيتم استخدامه لجلب بيانات المستخدم

  const profile({Key? key, required this.userId}) : super(key: key);

  @override
  State<profile> createState() => _ProfileDesignState();
}

class _ProfileDesignState extends State<profile> {
  File? _profileImage;

  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  late TextEditingController _roleController;

  bool _isEditing = false;
  bool _isLoading = true; // متغير لمعرفة حالة تحميل البيانات

  @override
  void initState() {
    super.initState();
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _cityController = TextEditingController();
    _phoneController = TextEditingController();
    _roleController = TextEditingController();

    fetchUserProfile();
  }

  /// 🔹 **دالة جلب بيانات المستخدم من API**
  Future<void> fetchUserProfile() async {
    final String apiUrl =
        "https://innova-hub.premiumasp.net/api/Profile/profile/${widget.userId}";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          _firstnameController.text = data['firstName'] ?? '';
          _lastnameController.text = data['lastName'] ?? '';
          _emailController.text = data['email'] ?? '';
          _passwordController.text = '********';
          _cityController.text = data['city'] ?? '';
          _phoneController.text = data['phoneNumber'] ?? '';
          _roleController.text = data['role'] ?? '';

          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load profile data");
      }
    } catch (error) {
      print("Error fetching user profile: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/photo_5816892861919119516_y.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                            backgroundColor: Colors.grey[200],
                            child: _profileImage == null
                                ? const Icon(Icons.person,
                                    size: 60, color: Colors.grey)
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.edit,
                                  color: maincolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 🔹 **معلومات المستخدم**
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(100)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_firstnameController.text} ${_lastnameController.text}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const Text(
                            "ID : 12345678",
                            style: TextStyle(
                                color: Color.fromARGB(255, 89, 87, 87),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 **تفاصيل الملف الشخصي**
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        _buildProfileField("Email", _emailController),
                        _buildProfileField("Phone Number", _phoneController),
                        _buildProfileField("City", _cityController),
                        const Divider(color: Colors.grey, thickness: 1),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 **روابط أخرى**
                  _buildListTile(Icons.lock, "Privacy & Security", () {
                    Navigator.pushNamed(
                        context, privacyandsecurityforcustomer.routname);
                  }),
                  _buildListTile(Icons.payment, "Payment Method", () {}),

                  const SizedBox(height: 30),

                  // 🔹 **زر تسجيل الخروج**
                  _buildListTile(Icons.logout, "Log Out", () {
                    // منطق تسجيل الخروج هنا
                  }),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label: ${controller.text}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}



  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label: ${controller.text}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

*/
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/screens/privacyandsecurityforcustomer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const Color maincolor = Color.fromARGB(255, 6, 122, 216); // اللون الرئيسي
const Color textcolor = Colors.black; // لون النصوص

class profile extends StatefulWidget {
  static String routeName = "profiledesign";

  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<profile> {
  File? _profileImage;
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  late TextEditingController _roleController;
  String? userid;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _emailController = TextEditingController();
    _cityController = TextEditingController();
    _phoneController = TextEditingController();
    _roleController = TextEditingController();

    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    setState(() => _isLoading = true);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      userid = prefs.getString("userId");

      if (token == null) {
        throw Exception("Token is missing, please log in again.");
      }

      final response = await http.get(
        Uri.parse("https://innova-hub.premiumasp.net/api/Profile/profile"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          _firstnameController.text = data['FirstName'] ?? '';
          _lastnameController.text = data['LastName'] ?? '';
          _emailController.text = data['Email'] ?? '';
          _cityController.text = data['City'] ?? '';
          _phoneController.text = data['PhoneNumber'] ?? '';
          _roleController.text = data['RoleName'] ?? '';

          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load profile data");
      }
    } catch (error) {
      print("Error fetching user profile: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/photo_5816892861919119516_y.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                            backgroundColor: Colors.grey[200],
                            child: _profileImage == null
                                ? const Icon(Icons.person,
                                    size: 60, color: Colors.grey)
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.edit,
                                  color: maincolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(100)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_firstnameController.text} ${_lastnameController.text}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "User ID: ${userid ?? 'Loading...'}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 89, 87, 87),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        _buildProfileField("Email", _emailController),
                        _buildProfileField("Phone Number", _phoneController),
                        _buildProfileField("City", _cityController),
                        const Divider(color: Colors.grey, thickness: 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildListTile(Icons.lock, "Privacy & Security", () {
                    Navigator.pushNamed(
                        context, privacyandsecurityforcustomer.routname);
                  }),
                  _buildListTile(Icons.payment, "Payment Method", () {}),
                  const SizedBox(height: 30),
                  _buildListTile(Icons.logout, "Log Out", () {}),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label: ${controller.text}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

Widget _buildProfileField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "$label: ${controller.text}",
            style: const TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    ),
  );
}
