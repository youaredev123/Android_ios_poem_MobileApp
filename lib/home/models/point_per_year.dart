class PointsPerYear {
 
  String year;
  int value;

  PointsPerYear(this.year, this.value);

  PointsPerYear._internalFromJson(Map jsonMap)
      : year = jsonMap['month'].toString(),
        value = jsonMap['value'] as int;
  factory PointsPerYear.fromPrefsJson(Map jsonMap) => PointsPerYear._internalFromJson(jsonMap);
}