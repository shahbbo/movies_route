import 'package:flutter/material.dart';

import 'package:flutter_projects/features/auth/ui/login_screen/login_body.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginBody();
  }
}
