import 'package:flutter/material.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Browse View',
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
