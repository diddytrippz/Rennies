import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String capitalia(String? inputtext) {
  // make a string all uppercase
  if (inputtext == null) {
    return '';
  } else
    return inputtext.toUpperCase();
}

String? initials(String? myNames) {
  // return the first letter of the word
  if (myNames == null) return null;
  final List<String> letterBag = [];
  List<String> splitNames = myNames.split(' ');
  splitNames.forEach((element) {
    letterBag.add(element[0]);
  });
  return letterBag.reduce((a, b) {
    return a + b;
  });
}

double? countRecordsSubmitted(List<MaintenanceRecord>? jobs) {
  // select count from input jobs if  status==Submitted and return list length
  if (jobs != null) {
    List<MaintenanceRecord> statusSubmittedRec = [];
    for (int i = 0; i < jobs.length; i++) {
      if (jobs[i].status == 'Submitted') {
        statusSubmittedRec.add(jobs[i]);
      }
    }
    return statusSubmittedRec.length / 100;
  }
  return 0;
}

double? countRecordsPending(List<MaintenanceRecord>? jobs) {
  // select count from input jobs if  status==Submitted and return list length
  if (jobs != null) {
    List<MaintenanceRecord> statusSubmittedRec = [];
    for (int i = 0; i < jobs.length; i++) {
      if (jobs[i].status == 'Pending') {
        statusSubmittedRec.add(jobs[i]);
      }
    }
    return statusSubmittedRec.length / 100;
  }
  return 0;
}

double? countRecordsCompleted(List<MaintenanceRecord>? jobs) {
  // select count from input jobs if  status==Submitted and return list length
  if (jobs != null) {
    List<MaintenanceRecord> statusSubmittedRec = [];
    for (int i = 0; i < jobs.length; i++) {
      if (jobs[i].status == 'Completed') {
        statusSubmittedRec.add(jobs[i]);
      }
    }
    return statusSubmittedRec.length / 100;
  }
  return 0;
}
