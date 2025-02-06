import 'dart:io';
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

/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const Color maincolor = Color.fromARGB(255, 6, 122, 216);

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
  State<profile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<profile> {
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

  void _removeImage() {
    setState(() {
      _profileImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            // صورة البروفايل مع التعديل والحذف
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    backgroundColor: Colors.grey[300],
                    child: _profileImage == null
                        ? const Icon(Icons.person, size: 65, color: Colors.grey)
                        : null,
                  ),

                  // زر تعديل الصورة (📷)
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.camera_alt,
                          color: maincolor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),

                  // زر حذف الصورة (🗑️)
                  if (_profileImage != null)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: _removeImage,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // بيانات المستخدم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  _buildProfileField("First Name", _firstnameController),
                  _buildProfileField("Last Name", _lastnameController),
                  _buildProfileField("Email", _emailController),
                  _buildProfileField("Phone Number", _phoneController),
                  _buildProfileField("City", _cityController),
                  _buildProfileField("Role", _roleController),
                  const Divider(color: Colors.grey, thickness: 1),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // زر تسجيل الخروج
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.logout, color: Colors.blue),
                      const SizedBox(width: 8),
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
                fontWeight: FontWeight.bold,
              ),
            ),
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
    );
  }
}*/
