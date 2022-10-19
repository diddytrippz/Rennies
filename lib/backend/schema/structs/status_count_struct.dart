import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'status_count_struct.g.dart';

abstract class StatusCountStruct
    implements Built<StatusCountStruct, StatusCountStructBuilder> {
  static Serializer<StatusCountStruct> get serializer =>
      _$statusCountStructSerializer;

  double? get pending;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(StatusCountStructBuilder builder) => builder
    ..pending = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  StatusCountStruct._();
  factory StatusCountStruct([void Function(StatusCountStructBuilder) updates]) =
      _$StatusCountStruct;
}

StatusCountStruct createStatusCountStruct({
  double? pending,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusCountStruct(
      (s) => s
        ..pending = pending
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

StatusCountStruct? updateStatusCountStruct(
  StatusCountStruct? statusCount, {
  bool clearUnsetFields = true,
}) =>
    statusCount != null
        ? (statusCount.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addStatusCountStructData(
  Map<String, dynamic> firestoreData,
  StatusCountStruct? statusCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statusCount == null) {
    return;
  }
  if (statusCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && statusCount.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusCountData =
      getStatusCountFirestoreData(statusCount, forFieldValue);
  final nestedData =
      statusCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = statusCount.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getStatusCountFirestoreData(
  StatusCountStruct? statusCount, [
  bool forFieldValue = false,
]) {
  if (statusCount == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(StatusCountStruct.serializer, statusCount);

  // Add any Firestore field values
  statusCount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusCountListFirestoreData(
  List<StatusCountStruct>? statusCounts,
) =>
    statusCounts?.map((s) => getStatusCountFirestoreData(s, true)).toList() ??
    [];
