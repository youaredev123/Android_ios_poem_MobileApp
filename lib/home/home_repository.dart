import 'dart:convert';
import 'package:poem_mobile/home/models/point_per_year.dart';
import 'package:poem_mobile/home/models/saving_summary.dart';

class HomeRepository {
  Future<SavingSummary> retrieveSavingSummary(int id) async {
    var _data =
        '{"status":200,"message":"Data Found","content":{"data":{"paidWithoutPoem":65000,"paidWithPoem":50000,"overPaid":15000}}}';
    var res = json.decode(_data);
    var content = res['content'];
    var data = content['data'] as Map;
    return SavingSummary.fromPrefsJson(data);
  }
  
  Future<List<List<PointsPerYear>>> retrieveDeductibleData(int id) async {
    await Future.delayed(Duration(seconds: 1));
    var _data =
        '{"status":200,"message":"Data Found","content":{"data":[{"line1":[{"month":"Jan","value":20},{"month":"Feb","value":25},{"month":"Mar","value":30},{"month":"Apr","value":35}],"line2":[{"month":"Jan","value":10},{"month":"Feb","value":18},{"month":"Mar","value":24},{"month":"Apr","value":32}],"line3":[{"month":"Jan","value":25},{"month":"Feb","value":27},{"month":"Mar","value":30},{"month":"Apr","value":33}]}]}}';
    var res = json.decode(_data);
    var content = res['content'];
    var data = content['data'];
    var lineData = data[0];
    
    List<PointsPerYear> line1 = (lineData['line1'] as List<dynamic>)
        .map<PointsPerYear>(
            (point) => PointsPerYear.fromPrefsJson(point as Map))
        .toList();
    List<PointsPerYear> line2 = (lineData['line2'] as List<dynamic>)
        .map<PointsPerYear>(
            (point) => PointsPerYear.fromPrefsJson(point as Map))
        .toList();
    List<PointsPerYear> line3 = (lineData['line3'] as List<dynamic>)
        .map<PointsPerYear>(
            (point) => PointsPerYear.fromPrefsJson(point as Map))
        .toList();

    List<List<PointsPerYear>> oopData = [];
    oopData.add(line1);
    oopData.add(line2);
    oopData.add(line3);
    
    print(oopData);
    return oopData;
  }
  
  Future<List<List<PointsPerYear>>> retrieveOOPData(int id) async {
    var _data =
        '{"status":200,"message":"Data Found","content":{"data":[{"line1":[{"month":"Jan","value":20},{"month":"Feb","value":25},{"month":"Mar","value":30},{"month":"Apr","value":35}],"line2":[{"month":"Jan","value":10},{"month":"Feb","value":18},{"month":"Mar","value":24},{"month":"Apr","value":32}],"line3":[{"month":"Jan","value":25},{"month":"Feb","value":27},{"month":"Mar","value":30},{"month":"Apr","value":33}]}]}}';
    var res = json.decode(_data);
    var content = res['content'];
    var data = content['data'];
    var lineData = data[0];

    List<PointsPerYear> line1 = (lineData['line1'] as List<dynamic>)
        .map<PointsPerYear>(
            (point) => PointsPerYear.fromPrefsJson(point as Map))
        .toList();
    List<PointsPerYear> line2 = (lineData['line2'] as List<dynamic>)
        .map<PointsPerYear>(
            (point) => PointsPerYear.fromPrefsJson(point as Map))
        .toList();
    List<PointsPerYear> line3 = (lineData['line3'] as List<dynamic>)
        .map<PointsPerYear>(
            (point) => PointsPerYear.fromPrefsJson(point as Map))
        .toList();

    List<List<PointsPerYear>> oopData = [];
    oopData.add(line1);
    oopData.add(line2);
    oopData.add(line3);
    return oopData;
  }
}
