import 'package:camp_finder/app/domain/entities/additional_info.dart';

class AdditionalInfoResponse extends AdditionalInfo {
  AdditionalInfoResponse({required super.type, required super.info});
  factory AdditionalInfoResponse.fromFirestore(Map<String, dynamic> data) {
    return AdditionalInfoResponse(
      type: data['type'] ?? '',
      info: data['info'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'info': info,
    };
  }
}
