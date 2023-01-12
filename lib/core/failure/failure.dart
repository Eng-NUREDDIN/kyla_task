
///base class for all failure.
abstract class Failure {
  final String message;
  final String code;

  Failure({
    required this.message,
    required this.code,
  });
}
