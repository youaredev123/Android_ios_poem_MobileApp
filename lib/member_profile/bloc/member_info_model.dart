import 'package:flutter/material.dart';
import 'package:poem_mobile/helpers/helpers.dart';

class MemberInfo {

  String memberID;
  Image barcodeImage;
  
  MemberInfo._internalFromJson(Map jsonMap) {
    memberID = jsonMap['memberId'] as String;
    String barCodeBase64String = jsonMap['barcode'] as String;
    var splits = barCodeBase64String.split(',');
    barCodeBase64String = splits[1];
    
    barcodeImage = fromBase64String(barCodeBase64String);
  }
  factory MemberInfo.fromPrefsJson(Map jsonMap) => MemberInfo._internalFromJson(jsonMap);
}