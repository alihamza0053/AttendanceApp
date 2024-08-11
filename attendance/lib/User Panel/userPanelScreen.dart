import 'package:flutter/material.dart';

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Row(children: [
              Text("Ali Hamza",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), Spacer(),
              CircleAvatar(
                radius: 25,
                child: Icon(Icons.image),
              )
            ],),
          )
        ],
      ),
    );
  }
}
