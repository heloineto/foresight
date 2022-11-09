import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foresight/services/auth.dart';
import 'package:foresight/services/models.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Investment>> getInvestments() async {
    var user = AuthService().user!;
    var ref = _db.collection('user').doc(user.uid).collection('investments');

    var snapshot = await ref.get();

    var investments = snapshot.docs.map((doc) {
      var data = doc.data();
      data['id'] = doc.id;

      return Investment.fromJson(data);
    }).toList();

    return investments;
  }

  Future<void> setInvestment(Investment investment) async {
    var user = AuthService().user!;

    var ref = _db
        .collection('user')
        .doc(user.uid)
        .collection('investments')
        .doc(investment.id);

    var data = investment.toJson();

    return ref.set(data);
  }

  Future<void> deleteInvestment(Investment investment) async {
    var user = AuthService().user!;

    var ref = _db
        .collection('user')
        .doc(user.uid)
        .collection('investments')
        .doc(investment.id);

    return ref.delete();
  }

  Stream<List<Investment>> streamInvestments() {
    return AuthService().userStream.switchMap((user) {
      if (user == null) {
        return Stream.fromIterable([]);
      }

      var ref = _db.collection('user').doc(user.uid).collection('investments');

      Stream<List<Investment>> investmentsStream = ref.snapshots().map(
        (snapshot) {
          List<Investment> investments = snapshot.docs.map((doc) {
            var data = doc.data();
            data['id'] = doc.id;

            return Investment.fromJson(data);
          }).toList();

          return investments;
        },
      );

      return investmentsStream;
    });
  }
}
