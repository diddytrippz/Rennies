import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_record.g.dart';

abstract class MaintenanceRecord
    implements Built<MaintenanceRecord, MaintenanceRecordBuilder> {
  static Serializer<MaintenanceRecord> get serializer =>
      _$maintenanceRecordSerializer;

  String? get issue;

  String? get status;

  String? get email;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get room;

  String? get building;

  String? get notes;

  int? get rating;

  bool? get isDone;

  String? get category;

  String? get assigned;

  DateTime? get updateTime;

  DocumentReference? get userRec;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ref;
  DocumentReference get reference => ref!;

  static void _initializeBuilder(MaintenanceRecordBuilder builder) => builder
    ..issue = ''
    ..status = ''
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..displayName = ''
    ..room = ''
    ..building = ''
    ..notes = ''
    ..rating = 0
    ..isDone = false
    ..category = ''
    ..assigned = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maintenance');

  static Stream<MaintenanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MaintenanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MaintenanceRecord._();
  factory MaintenanceRecord([void Function(MaintenanceRecordBuilder) updates]) =
      _$MaintenanceRecord;

  static MaintenanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMaintenanceRecordData({
  String? issue,
  String? status,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? displayName,
  String? room,
  String? building,
  String? notes,
  int? rating,
  bool? isDone,
  String? category,
  String? assigned,
  DateTime? updateTime,
  DocumentReference? userRec,
}) =>
    serializers.toFirestore(
        MaintenanceRecord.serializer,
        MaintenanceRecord((m) => m
          ..issue = issue
          ..status = status
          ..email = email
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..displayName = displayName
          ..room = room
          ..building = building
          ..notes = notes
          ..rating = rating
          ..isDone = isDone
          ..category = category
          ..assigned = assigned
          ..updateTime = updateTime
          ..userRec = userRec));
