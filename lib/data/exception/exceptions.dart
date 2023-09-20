class ServerException implements Exception {}

class DataParsingException implements Exception {}

class NoConnectionException implements Exception {
  final bool status;
  final String message;
  NoConnectionException(this.status, this.message);

  @override
  String toString() =>
      'NoConnectionException{status=$status, message=$message}';
}
