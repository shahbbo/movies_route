import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile View',
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),),
    );
  }
}
