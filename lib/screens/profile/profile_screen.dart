import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temu/const/app_color.dart';
import 'package:temu/models/profile/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  final String test = 'Hello world!';

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController introductionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  bool isChanged = false;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    introductionController.dispose();
    locationController.dispose();
    roleController.dispose();
    genderController.dispose();
    super.dispose();
  }

  _handleUpdate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    minLines: 3,
                    maxLines: 3,
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
                    enabled: false,
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tags',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(AppColor.text),
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: -8.0,
                    children: [
                      Chip(
                        label: Text('Gym'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('Food'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('Famous'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('Cheap'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('Good'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('Professional'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('Extraordinary'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                      Chip(
                        label: Text('creative'),
                        backgroundColor: Color(AppColor.accent),
                        labelStyle: TextStyle(
                          color: Color(AppColor.background),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Social Media',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(AppColor.text),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SocialMediaComponent(
                      socialMedia: SocialMedia(
                        name: 'Tiktok',
                        account: 'kruzikale',
                      ),
                    ),
                    SocialMediaComponent(
                      socialMedia: SocialMedia(
                        name: 'Instagram',
                        account: 'marchel54',
                      ),
                    ),
                    SocialMediaComponent(
                      socialMedia: SocialMedia(
                        name: 'Twitter',
                        account: 'marchel54',
                      ),
                    ),
                    SocialMediaComponent(
                      socialMedia: SocialMedia(
                        name: 'Youtube',
                        account: 'marchel54',
                      ),
                    ),
                    SocialMediaComponent(
                      socialMedia: SocialMedia(
                        name: 'Facebook',
                        account: 'marchel54',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                onPressed: isChanged ? _handleUpdate : null,
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(AppColor.accent),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Update profile',
                    style: TextStyle(
                      color: Color(AppColor.background),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(AppColor.background),
    );
  }
}

class SocialMediaComponent extends StatelessWidget {
  final SocialMedia socialMedia;

  const SocialMediaComponent({super.key, required this.socialMedia});

  SvgPicture getSocialMediaIcon(String socialMediaName) {
    final icons = {
      'Tiktok': 'lib/assets/tt-icon.svg',
      'Instagram': 'lib/assets/ig-icon.svg',
      'Facebook': 'lib/assets/fb-icon.svg',
      'Youtube': 'lib/assets/yt-icon.svg',
      'Twitter': 'lib/assets/twt-icon.svg',
    };

    final iconAsset = icons[socialMediaName];
    const defaultIconAsset = 'lib/assets/default-icon.svg';

    return SvgPicture.asset(
      iconAsset ?? defaultIconAsset,
      width: 24,
      height: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getSocialMediaIcon(socialMedia.name),
            const SizedBox(height: 8.0),
            Text(socialMedia.account)
          ],
        ),
      ),
    );
  }
}
