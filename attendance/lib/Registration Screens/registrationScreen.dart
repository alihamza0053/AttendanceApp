import 'package:attendance/Registration%20Screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  var studentColor = const Color(0xFF0099FF);
  var adminColor = const Color(0xFFFFFFFF);

  File? image;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                          child: Text(
                        "Registration",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 20,),
                      Center(
                        child: GestureDetector(
                          onTap: ()async{
                            final pickImage = await picker.pickImage(source: ImageSource.gallery);
                            if(pickImage != null){
                              setState(() {
                                image = File(pickImage.path);
                              });
                            }
                          },
                          child: image == null 
                          ? CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add_a_photo),
                          ) : CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(image!),
                          ),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: "Registration No.",
                            hintStyle: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400)),
                      ),
                      const TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400)),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: "Class",
                            hintStyle: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("I am:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                studentColor = const Color(0xFF0099FF);
                                adminColor = const Color(0xFFFFFFFF);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: studentColor,
                                  border: Border.all(color: Colors.white)),
                              child: const Text(
                                "Student",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1f2530)),
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                studentColor = const Color(0xFFFFFFFF);
                                adminColor = const Color(0xFF0099FF);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: adminColor,
                                  border: Border.all(color: Colors.white)),
                              child: const Text("Admin",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1f2530))),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Registered! "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
