import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  static const routname = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Homescreen",
          style: TextStyle(color: Colors.brown),
        ),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
