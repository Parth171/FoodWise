import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int? myFunction(int? foodLife) {
  if (foodLife != null) {
    return foodLife + 3;
  } else {
    return null;
  }
}

int shelfLifeFunction(DateTime itemDate) {
  // write code to minus currentdate from itemDate
  DateTime currentDate = DateTime.now();
  Duration difference = itemDate.difference(currentDate);
  int days = difference.inDays;
  return days;
}

int? inventoryCheck(
  DateTime? itemDate,
  int? foodLife,
) {
  // function to minus return value of shelfLifeFunction from the absolute value of foodLife
  int? shelfLife = itemDate != null ? shelfLifeFunction(itemDate) : null;
  int? result =
      shelfLife != null && foodLife != null ? foodLife.abs() + shelfLife : null;
  return result;
}
