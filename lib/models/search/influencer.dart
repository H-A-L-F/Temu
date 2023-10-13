import 'package:cloud_firestore/cloud_firestore.dart';

class Influencer {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  Influencer({required this.tags, required this.title, required this.description, required this.imageUrl});

  factory Influencer.fromDocument(QueryDocumentSnapshot doc) {
    return Influencer(
        tags: (doc['tag'] as List).cast<String>(),
        title: doc['firstName'],
        description: doc['introduction'],
        imageUrl: doc['profileImage']
    );
  }
}