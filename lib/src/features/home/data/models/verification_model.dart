import '../../domain/entities/verification.dart';

class VerificationModel extends Verification {
  const VerificationModel({
    required super.verified,
    required super.reason,
    required super.signature,
    required super.payload,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) {
    return VerificationModel(
      verified: json["verified"],
      reason: json["reason"],
      signature: json["signature"],
      payload: json["payload"],
    );
  }
}
