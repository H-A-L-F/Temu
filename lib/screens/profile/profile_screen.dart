import 'package:flutter/material.dart';
import 'package:temu/const/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  final String test = 'Hello world!';

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Profilea',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/temu-4793d.appspot.com/o/profile_images%2FWIN_20231006_23_37_51_Pro.jpg?alt=media&token=6c6ebce5-e989-4492-b869-fe80b23b3502&_gl=1*1y7snzi*_ga*MTY1Mzg0OTc4OS4xNjk2NDE3NjMy*_ga_CW55HF8NVT*MTY5NjYxMDA4NC4zLjEuMTY5NjYxMDMwMC41Ny4wLjA.',
                  scale: 1,
                ),
                radius: 100,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(AppColor.background),
    );
  }
}
