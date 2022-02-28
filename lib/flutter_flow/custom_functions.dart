import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int recordList(List<DocumentReference> numberofrecords) {
  // return length of the list
  int counter = 0;

  for (int i = 0; i < numberofrecords.length; i++) {
    counter++;
  }

  return counter;
}
