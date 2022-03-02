import 'dart:convert';
import 'package:poem_mobile/search_history/bloc/bloc.dart';

class SearchHistoryRepository {
  
  Future<List<SearchHistory>> searchHistory(int id) async {
    await Future.delayed(Duration(seconds: 1));
    var _data =
        '{"status":200,"message":"Patient History Found","data":[{"id":1,"searchTime":"2019-08-15 14:45","ProviderId":112,"providerName":"ProviderName","providerAddress":"Locaiton of provider"},{"id":2,"searchTime":"2019-08-16 14:45","ProviderId":113,"providerName":"ProviderName","providerAddress":"Locaiton of provider"},{"id":3,"searchTime":"2019-08-17 14:45","ProviderId":114,"providerName":"ProviderName","providerAddress":"Locaiton of provider"}]}';
    var res = json.decode(_data);
    return (res['data'] as List<dynamic>)
        .map<SearchHistory>(
            (historyJson) => SearchHistory.fromPrefsJson(historyJson as Map))
        .toList();
  }
  
  Future<bool> updateConcerns() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
