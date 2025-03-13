import 'package:flutter/material.dart';
import 'package:flutter_project_structure/helper/regex_helper.dart';
import 'package:intl/intl.dart';

extension StringExt on String? {
  bool isNotNullAndEmpty() {
    if (this == null) {
      return false;
    }
    return this!.isNotEmpty;
  }

  int countWord() {
    if (this == null) {
      return 0;
    }
    final Iterable<RegExpMatch> matches =
        RegexHelper.regexCountWord.allMatches(this ?? '');
    return matches.length;
  }

  DateTime formatHHMMSS() {
    if (this == null) {
      return DateTime.now();
    }
    final DateFormat dateFormat = DateFormat('HH:mm:ss');
    return dateFormat.parse(this!);
  }

  DateTime formatMMDDYYYY() {
    if (this == null) {
      return DateTime.now();
    }
    final DateFormat dateFormat = DateFormat('MM/dd/yyyy');
    return dateFormat.parse(this!);
  }

  DateTime formatDDMMYYYY() {
    if (this == null) {
      return DateTime.now();
    }
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.parse(this!);
  }

  DateTime formatYYYYMMDD() {
    if (this == null) {
      return DateTime.now();
    }
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.parse(this!);
  }

  DateTime formatDDMMMYYYY() {
    if (this == null) {
      return DateTime.now();
    }
    final DateFormat dateFormat = DateFormat('DD MMM, yyyy');
    return dateFormat.parse(this!);
  }

  DateTime formatDDMMYYYYhhmmss() {
    if (this == null) {
      return DateTime.now();
    }
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy hh:mm:ss');
    return dateFormat.parse(this!);
  }

  String removeLastCharacter() {
    if (this == null) {
      return '';
    }
    if (this!.isNotEmpty) {
      return this!.substring(0, this!.length - 1);
    }
    return this!; // Return the original string if it's empty
  }

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return this!.isNotEmpty && double.tryParse(this!) != null;
  }

  bool isNetworkUrl() {
    if (this == null) {
      return false;
    }
    if (this!.contains('http') || this!.contains('https')) {
      return true;
    }
    return false;
  }

  String capitalize() {
    if (this == null) {
      return '';
    }
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  TimeOfDay? stringToTimeOfDay() {
    if (this == null) {
      return null;
    }
    final List<String> format = this!.split(':');
    final int hour = int.parse(format[0]);
    final int minute = int.parse(format[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }
}
