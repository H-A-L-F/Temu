import 'package:flutter/material.dart';
import 'package:temu/const/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text("This is Home screen"),
      ),
      backgroundColor: Color(AppColor.background),
    );
  }
}
