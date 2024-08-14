import 'package:flutter/material.dart';
import 'package:todo_app/module/screens/layout_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});
  static const String routename="/";

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacementNamed(LayoutScreen.routename);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image.asset("assets/images/splash.png"),
        ),
      );
  }
}
