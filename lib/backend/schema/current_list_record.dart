import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentListRecord extends FirestoreRecord {
  CurrentListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "itemType" field.
  String? _itemType;
  String get itemType => _itemType ?? '';
  bool hasItemType() => _itemType != null;

  // "itemDate" field.
  DateTime? _itemDate;
  DateTime? get itemDate => _itemDate;
  bool hasItemDate() => _itemDate != null;

  // "foodLife" field.
  int? _foodLife;
  int get foodLife => _foodLife ?? 0;
  bool hasFoodLife() => _foodLife != null;

  void _initializeFields() {
    _itemName = snapshotData['itemName'] as String?;
    _itemType = snapshotData['itemType'] as String?;
    _itemDate = snapshotData['itemDate'] as DateTime?;
    _foodLife = castToType<int>(snapshotData['foodLife']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('currentList');

  static Stream<CurrentListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentListRecord.fromSnapshot(s));

  static Future<CurrentListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CurrentListRecord.fromSnapshot(s));

  static CurrentListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentListRecordData({
  String? itemName,
  String? itemType,
  DateTime? itemDate,
  int? foodLife,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemName': itemName,
      'itemType': itemType,
      'itemDate': itemDate,
      'foodLife': foodLife,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurrentListRecordDocumentEquality implements Equality<CurrentListRecord> {
  const CurrentListRecordDocumentEquality();

  @override
  bool equals(CurrentListRecord? e1, CurrentListRecord? e2) {
    return e1?.itemName == e2?.itemName &&
        e1?.itemType == e2?.itemType &&
        e1?.itemDate == e2?.itemDate &&
        e1?.foodLife == e2?.foodLife;
  }

  @override
  int hash(CurrentListRecord? e) => const ListEquality()
      .hash([e?.itemName, e?.itemType, e?.itemDate, e?.foodLife]);

  @override
  bool isValidKey(Object? o) => o is CurrentListRecord;
}
