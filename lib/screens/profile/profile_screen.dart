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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/temu-4793d.appspot.com/o/profile_images%2FS__21184514.jpg?alt=media&token=d52768ee-b599-4be4-bad9-c31948d3e313&_gl=1*1iad3y3*_ga*MTc4Nzc0NDIwMC4xNjk2MjEwNTAz*_ga_CW55HF8NVT*MTY5NjgzNjc0Ni45LjEuMTY5NjgzNzAyMS4xOS4wLjA.',
                    scale: 1,
                  ),
                  radius: 64,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('FirstName'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(AppColor.text),
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text('LastName'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(AppColor.text),
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                minLines: 4,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(AppColor.text),
                      style: BorderStyle.solid,
                    ),
                  ),
                  label: Text('Introduction'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Role'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(AppColor.text),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                enabled: false,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Gender'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(AppColor.text),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Location'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(AppColor.text),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Date of Birth'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(AppColor.text),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                enabled: false,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(AppColor.background),
    );
  }
}
