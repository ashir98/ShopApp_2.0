import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users list"),
        centerTitle: true,
      ),


      body: Column(
        children: const [
          Text("USERS LIST")
        ],
      ),
    );
  }
}