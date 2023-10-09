import 'package:cloud_firestore/cloud_firestore.dart';

class Influencer {
  final String title;
  final String description;
  final String imageUrl;
  Influencer({required this.title, required this.description, required this.imageUrl});

  factory Influencer.fromDocument(QueryDocumentSnapshot doc) {
    return Influencer(
        title: doc['firstName'],
        description: doc['introduction'],
        imageUrl: doc['profileImage']
    );
  }
}