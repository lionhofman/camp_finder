import 'package:camp_finder/app/domain/entities/open_hour.dart';

class OpenHourResponse extends OpenHour {
  OpenHourResponse({required super.day, required super.hours});

  factory OpenHourResponse.fromFirestore(Map<String, dynamic> data) {
    return OpenHourResponse(
      day: data['day'] ?? '',
      hours: data['hours'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'day': day,
      'hours': hours,
    };
  }
}
