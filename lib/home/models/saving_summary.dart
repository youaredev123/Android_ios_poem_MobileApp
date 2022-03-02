class SavingSummary {
  
  int paidWithoutPoem;
  int paidWithPoem;
  int overPaid;
  
  SavingSummary._internalFromJson(Map jsonMap)
      : paidWithoutPoem = jsonMap['paidWithoutPoem'] as int,
        paidWithPoem = jsonMap['paidWithPoem'] as int,
        overPaid = jsonMap['overPaid']?.toInt() as int;
  factory SavingSummary.fromPrefsJson(Map jsonMap) => SavingSummary._internalFromJson(jsonMap);
}
