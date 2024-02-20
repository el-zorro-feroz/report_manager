/// Store applocation error info.
class Failure {
  /// Creates an instance of [Failure].
  const Failure({
    required this.message,
    required this.stackTrace,
  });

  /// Error description.
  final String message;

  /// Error stack trace.
  final StackTrace stackTrace;
}
