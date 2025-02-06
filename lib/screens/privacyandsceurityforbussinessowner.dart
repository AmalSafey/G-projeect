import 'package:flutter/material.dart';

class privacyandsecurityforownerandinvestor extends StatelessWidget {
  static String routname = 'privacyandsecurityforownerandinvestor';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Privacy & Security"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 330,
                  width: 380,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 225, 225),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.perm_identity,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Identity Verification",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                                'You must provide a valid and clear ID images. '),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Send ID Front and Back image.'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Reviewing ID may take some time. '),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Icon(Icons.upload_file),
                                  height: 80,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Front ID Image")
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Icon(Icons.upload_file),
                                  height: 80,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Back ID Image")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(
                              "Send Image",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: 380,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 225, 225),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "change Password",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your email.....",
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          keyboardType: TextInputType
                              .emailAddress, // Keyboard optimized for emails
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(
                              "Send Email",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                  width: 380,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 225, 225),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Account Deletion",
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.blue,
                            ),
                            child: Text(
                              "Delete Account",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
