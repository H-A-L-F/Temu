import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temu/models/search/influencer.dart';

class InviteInfluencer extends StatefulWidget {
  final Influencer influencer;
  InviteInfluencer({required this.influencer});

  @override
  State<StatefulWidget> createState() => _InviteInfluencerState(influencer: influencer);
}

class _InviteInfluencerState extends State<InviteInfluencer> {
  final Influencer influencer;
  _InviteInfluencerState({required this.influencer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: Colors.green,
            ),
            Positioned(
                top: 200.0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(influencer.profileImage),
                )
            ),
            Positioned(
              top: 320.0,
              child: Column(
                children: [
                  Text(
                    influencer.firstName.toUpperCase() + " " + influencer.lastName.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

}