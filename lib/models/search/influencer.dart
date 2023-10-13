import 'package:cloud_firestore/cloud_firestore.dart';

class Influencer {
  final String firstName;
  final String lastName;
  final String description;
  final String profileImage;
  final List<String> tags;
  Influencer({required this.tags, required this.firstName, required this.description, required this.profileImage, required this.lastName});

  factory Influencer.fromDocument(QueryDocumentSnapshot doc) {
    return Influencer(
        tags: (doc['tag'] as List).cast<String>(),
        firstName: doc['firstName'],
        lastName: doc['lastName'],
        description: doc['introduction'],
        profileImage: doc['profileImage']
    );
  }
}