import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  User user;
  UserInfoPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "${user.name}",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(Icons.person),
            ),
            ListTile(
              title: Text(
                "${user.phone}",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(Icons.phone),
            ),
            if (user.email != null)
              ListTile(
                title: Text(
                  "${user.email}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: user.email != "" ? const Icon(Icons.email) : null,
              )
          ],
        ),
      ),
    );
  }
}
