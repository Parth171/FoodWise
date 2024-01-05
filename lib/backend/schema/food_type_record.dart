import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodTypeRecord extends FirestoreRecord {
  FoodTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "foodType" field.
  String? _foodType;
  String get foodType => _foodType ?? '';
  bool hasFoodType() => _foodType != null;

  // "foodLife" field.
  int? _foodLife;
  int get foodLife => _foodLife ?? 0;
  bool hasFoodLife() => _foodLife != null;

  void _initializeFields() {
    _foodType = snapshotData['foodType'] as String?;
    _foodLife = castToType<int>(snapshotData['foodLife']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodType');

  static Stream<FoodTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodTypeRecord.fromSnapshot(s));

  static Future<FoodTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodTypeRecord.fromSnapshot(s));

  static FoodTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodTypeRecordData({
  String? foodType,
  int? foodLife,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'foodType': foodType,
      'foodLife': foodLife,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodTypeRecordDocumentEquality implements Equality<FoodTypeRecord> {
  const FoodTypeRecordDocumentEquality();

  @override
  bool equals(FoodTypeRecord? e1, FoodTypeRecord? e2) {
    return e1?.foodType == e2?.foodType && e1?.foodLife == e2?.foodLife;
  }

  @override
  int hash(FoodTypeRecord? e) =>
      const ListEquality().hash([e?.foodType, e?.foodLife]);

  @override
  bool isValidKey(Object? o) => o is FoodTypeRecord;
}
