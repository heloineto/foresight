import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foresight/services/auth.dart';
import 'package:foresight/settings/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Investment>> getInvestments() async {
    var user = AuthService().user!;
    var ref = _db.collection('user').doc(user.uid).collection('investments');

    var snapshot = await ref.get();

    var investments =
        snapshot.docs.map((doc) => Investment.fromJson(doc.data())).toList();

    return investments;
  }

  Future<void> setInvestment(Investment investment) async {
    var user = AuthService().user!;

    var ref =
        _db.collection('user').doc(user.uid).collection('investments').doc();

    var data = investment.toJson();

    return ref.set(data);
  }
}
