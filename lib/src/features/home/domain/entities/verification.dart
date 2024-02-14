class Verification {
  final bool verified;
  final String reason;
  final dynamic signature;
  final dynamic payload;

  const Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });
}
