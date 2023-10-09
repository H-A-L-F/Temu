import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temu/models/search/influencer.dart';

class FirestoreRepository {
  final CollectionReference itemsCollection = FirebaseFirestore.instance.collection('profiles');

  Future<List<Influencer>> fetchInfluencer() async {
    QuerySnapshot snapshot;
    snapshot = await itemsCollection.get();
    return snapshot.docs.map((doc) => Influencer.fromDocument(doc)).toList();
  }
}