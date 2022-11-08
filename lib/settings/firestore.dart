import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foresight/settings/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Investment>> getInvestments() async {
    var ref = _db.collection('investments');

    var snapshot = await ref.get();

    var investments =
        snapshot.docs.map((doc) => Investment.fromJson(doc.data()));

    return investments;
  }
}
