import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/module/screens/layout_screen.dart';
import '../auth/pages/login_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});
  static const String routename="/";

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, LayoutScreen.routename, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (route) => false);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
        body: Center(
          child: Image.asset("assets/images/splash.png"),
        ),
      );
  }
}
