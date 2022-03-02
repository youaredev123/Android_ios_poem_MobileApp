import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getExtensionWithPath(String fileName) {
  var splits = fileName.split('.');
  return splits.last;
}

Image fromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

String _getFormatedTime({dateTime = DateTime, format = String}) {
  return DateFormat(format as String).format(dateTime as DateTime);
}

String _convertTimeFormat(String timeString, String inputFormat, String outputFormat) {
   DateFormat originalFormat = DateFormat(inputFormat);
   DateTime dateTime = originalFormat.parse(timeString);
   DateFormat newFormat = DateFormat(outputFormat);
   return newFormat.format(dateTime);
}

String getFormatedDateTime(String timeStr, {String format = 'MM/dd/yyyy'}) {
  return _convertTimeFormat(timeStr, 'yyyy-MM-dd hh:mm', format);
}