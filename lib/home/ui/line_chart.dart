import 'package:flutter/material.dart';
import 'package:poem_mobile/home/models/point_per_year.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {

  final String title;
  const LineChart({Key key, this.title, this.lineData}) : super(key: key);
  final List<List<PointsPerYear>> lineData;

  List<LineSeries<PointsPerYear, String>> _buildMutipleLineSeries() {
    return lineData == null ?  <LineSeries<PointsPerYear, String>>[
      LineSeries<PointsPerYear, String>(
          dataSource: <PointsPerYear>[
            PointsPerYear('Jan', 0),
            PointsPerYear('Feb', 0),
            PointsPerYear('Mar', 0),
            PointsPerYear('Apr', 0),
            PointsPerYear('Jun', 0),
            PointsPerYear('Jul', 0),
            PointsPerYear('Aug', 0),
            PointsPerYear('Sep', 0),
            PointsPerYear('Oct', 0),
            PointsPerYear('Nov', 0),
            PointsPerYear('Dec', 0)
          ],
          xValueMapper: (PointsPerYear points, _) => points.year,
          yValueMapper: (PointsPerYear points, _) => points.value,
          color: Colors.transparent,
          dataLabelSettings: DataLabelSettings(isVisible: false)
      )] : <LineSeries<PointsPerYear, String>>[
      LineSeries<PointsPerYear, String>(
          dataSource: <PointsPerYear>[
            PointsPerYear('Jan', 0),
            PointsPerYear('Feb', 0),
            PointsPerYear('Mar', 0),
            PointsPerYear('Apr', 0),
            PointsPerYear('May', 0),
            PointsPerYear('Jun', 0),
            PointsPerYear('Jul', 0),
            PointsPerYear('Aug', 0),
            PointsPerYear('Sep', 0),
            PointsPerYear('Oct', 0),
            PointsPerYear('Nov', 0),
            PointsPerYear('Dec', 0)
          ],
          xValueMapper: (PointsPerYear points, _) => points.year,
          yValueMapper: (PointsPerYear points, _) => points.value,
          color: Colors.white12,
          dataLabelSettings: DataLabelSettings(isVisible: false)
      ),
      LineSeries<PointsPerYear, String>(
          dataSource: lineData[0],
          xValueMapper: (PointsPerYear points, _) => points.year,
          yValueMapper: (PointsPerYear points, _) => points.value,
          color: Colors.red,
          dataLabelSettings: DataLabelSettings(isVisible: false)
      ),
      LineSeries<PointsPerYear, String>(
          dataSource: lineData[1],
          xValueMapper: (PointsPerYear points, _) => points.year,
          yValueMapper: (PointsPerYear points, _) => points.value,
          color: Colors.blue,
          dataLabelSettings: DataLabelSettings(isVisible: false)
      ),
      LineSeries<PointsPerYear, String>(
          dataSource: lineData[2],
          xValueMapper: (PointsPerYear points, _) => points.year,
          yValueMapper: (PointsPerYear points, _) => points.value,
          color: Colors.green,
          dataLabelSettings: DataLabelSettings(isVisible: false)
      )
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 0),
            child: Text(title,style: TextStyle(fontSize: 12, color: Colors.black)),
          ),
          Expanded(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                    isVisible: true,
                    interval: 1
                ),
                backgroundColor: Colors.white,
                series: _buildMutipleLineSeries()
            ),
          )
        ],
      ),
    );
  }
}