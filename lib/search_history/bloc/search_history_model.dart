class SearchHistory {

  int id;
  int providerId;
  String searchTime;
  String providerName;
  String providerAddress;
  bool hasConcern;
  
  SearchHistory._internalFromJson(Map jsonMap)
      : id = jsonMap['id'] as int,
        providerId = jsonMap['ProviderId'] as int,
        searchTime = jsonMap['searchTime']  as String,
        providerName = jsonMap['providerName'] as String,
        providerAddress = jsonMap['providerAddress'] as String;
  factory SearchHistory.fromPrefsJson(Map jsonMap) => SearchHistory._internalFromJson(jsonMap);
}