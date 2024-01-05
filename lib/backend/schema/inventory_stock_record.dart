import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryStockRecord extends FirestoreRecord {
  InventoryStockRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemType" field.
  String? _itemType;
  String get itemType => _itemType ?? '';
  bool hasItemType() => _itemType != null;

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "itemDate" field.
  DateTime? _itemDate;
  DateTime? get itemDate => _itemDate;
  bool hasItemDate() => _itemDate != null;

  // "foodLife" field.
  int? _foodLife;
  int get foodLife => _foodLife ?? 0;
  bool hasFoodLife() => _foodLife != null;

  void _initializeFields() {
    _itemType = snapshotData['itemType'] as String?;
    _itemName = snapshotData['itemName'] as String?;
    _itemDate = snapshotData['itemDate'] as DateTime?;
    _foodLife = castToType<int>(snapshotData['foodLife']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventoryStock');

  static Stream<InventoryStockRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventoryStockRecord.fromSnapshot(s));

  static Future<InventoryStockRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventoryStockRecord.fromSnapshot(s));

  static InventoryStockRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventoryStockRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventoryStockRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventoryStockRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventoryStockRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventoryStockRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventoryStockRecordData({
  String? itemType,
  String? itemName,
  DateTime? itemDate,
  int? foodLife,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemType': itemType,
      'itemName': itemName,
      'itemDate': itemDate,
      'foodLife': foodLife,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventoryStockRecordDocumentEquality
    implements Equality<InventoryStockRecord> {
  const InventoryStockRecordDocumentEquality();

  @override
  bool equals(InventoryStockRecord? e1, InventoryStockRecord? e2) {
    return e1?.itemType == e2?.itemType &&
        e1?.itemName == e2?.itemName &&
        e1?.itemDate == e2?.itemDate &&
        e1?.foodLife == e2?.foodLife;
  }

  @override
  int hash(InventoryStockRecord? e) => const ListEquality()
      .hash([e?.itemType, e?.itemName, e?.itemDate, e?.foodLife]);

  @override
  bool isValidKey(Object? o) => o is InventoryStockRecord;
}
