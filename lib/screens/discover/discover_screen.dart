import 'package:flutter/material.dart';
import 'package:temu/const/app_color.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text("This is Discover screen"),
      ),
      backgroundColor: Color(AppColor.background),
    );
  }
}
