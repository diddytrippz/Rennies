import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'status_record.g.dart';

abstract class StatusRecord
    implements Built<StatusRecord, StatusRecordBuilder> {
  static Serializer<StatusRecord> get serializer => _$statusRecordSerializer;

  BuiltList<StatusCountStruct>? get counter;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StatusRecordBuilder builder) =>
      builder..counter = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('status');

  static Stream<StatusRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StatusRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StatusRecord._();
  factory StatusRecord([void Function(StatusRecordBuilder) updates]) =
      _$StatusRecord;

  static StatusRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStatusRecordData() {
  final firestoreData = serializers.toFirestore(
    StatusRecord.serializer,
    StatusRecord(
      (s) => s..counter = null,
    ),
  );

  return firestoreData;
}
