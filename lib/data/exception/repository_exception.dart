class RepoException implements Exception{
  final bool status;
  final String message;

  RepoException({required this.status, required this.message});
}