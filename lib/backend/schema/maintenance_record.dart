import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'maintenance_record.g.dart';

abstract class MaintenanceRecord
    implements Built<MaintenanceRecord, MaintenanceRecordBuilder> {
  static Serializer<MaintenanceRecord> get serializer =>
      _$maintenanceRecordSerializer;

  @nullable
  String get issue;

  @nullable
  String get status;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get room;

  @nullable
  String get building;

  @nullable
  String get notes;

  @nullable
  int get rating;

  @nullable
  bool get isDone;

  @nullable
  String get category;

  @nullable
  String get assigned;

  @nullable
  DateTime get updateTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

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
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MaintenanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MaintenanceRecord._();
  factory MaintenanceRecord([void Function(MaintenanceRecordBuilder) updates]) =
      _$MaintenanceRecord;

  static MaintenanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMaintenanceRecordData({
  String issue,
  String status,
  String email,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String displayName,
  String room,
  String building,
  String notes,
  int rating,
  bool isDone,
  String category,
  String assigned,
  DateTime updateTime,
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
          ..updateTime = updateTime));
