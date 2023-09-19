
class DataNotFoundException implements Exception{
  final bool status;
  final String message;
  DataNotFoundException(this.status, this.message) : super();

  @override
  String toString() =>
      'DataNotFoundException{statusCode=$status, message=$message}';
}