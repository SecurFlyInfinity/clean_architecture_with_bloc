import 'dart:io';

class RemoteKeys{
  String get baseURL => "newsapi.org";
  String get pathEverythingURL => "v2/everything";
  String get apiKey => "";
  Map<String,String> get headers=> {HttpHeaders.contentTypeHeader: "application/json"};
}