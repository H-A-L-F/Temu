import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  final String test = 'Hello world!';

  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Text(
          "This is edit profile screen, once user have defined their profile, they can edit through the form inside this screen"),
    );
  }
}
