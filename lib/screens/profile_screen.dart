import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  final String test = 'Hello world!';

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temu'),
        actions: const [
          Column(
            children: <Widget>[Text('btn1'), Text('btn2')],
          )
        ],
      ),
      body: const Text("The body"),
    );
  }
}
