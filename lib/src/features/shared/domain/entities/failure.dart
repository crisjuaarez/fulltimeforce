class Failure implements Exception {
  final int statusCode;
  final String message;

  const Failure(this.message, {this.statusCode = 404});
}
