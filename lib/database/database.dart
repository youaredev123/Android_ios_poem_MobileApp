import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DBProvider {
   
  static Database _database;
  
  DBProvider._();
  
  static final DBProvider db = DBProvider._();
  
  Future<Database> get database async {
   
    if(_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'poem.db');
    return await openDatabase(path, version: 1, onOpen: (db) async {
      await db.execute('CREATE TABLE claims (id INTEGER PRIMARY KEY, patientId INTEGER, ownerId INTEGER, ownerType TEXT, payToTaxID TEXT, providerEntityId INTEGER, billingEntityId INTEGER, payerId INTEGER, claimType TEXT, coPay REAL, estimatedCoPay REAL, deductible REAL, estimatedDeductible REAL, coInsurance REAL, estimatedCoInsurance REAL, selfPay REAL, estimatedSelfPay REAL, adjustments REAL, estimatedAdjustments REAL, isOutOfNetwork bit, isApprovedByPatient bit, approvedByPatientTime NUMERIC, parentClaimId INTEGER, providerGeneratedId TEXT, inusranceGeneratedId TEXT, dateOfServiceFrom TEXT, dateOfServiceTo TEXT, outOfNetwork REAL, notCovered REAL, noPriorAuthorization REAL, denied REAL, charity REAL, writeOff REAL, rebate REAL, coupon REAL, other REAL, status TEXT, unbundling TEXT, duplicate TEXT, approved TEXT, contractAssignment TEXT, isActive bit, isPaidByPatient bit, isSeenByPatient bit, isCompleted bit, isHearthFlag bit, isPoemDiscount bit, isInGiftProcess bit, isGiftReceived bit, patientPaidAmount REAL, patientBalanceAmount REAL, providerPaid REAL, providerBalanceAmount REAL, claimDescription TEXT, selfNote TEXT, payerNote TEXT, providerBilliingNote TEXT);');
      await db.execute('CREATE TABLE claimAttachmets (id INTEGER PRIMARY KEY, claimId INTEGER, fineName TEXT, fileUrl TEXT);');
    });
  }
}