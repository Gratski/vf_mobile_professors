import 'package:professors/models/notification_preference.model.dart';
import 'package:professors/models/notification_preference_type.model.dart';

class GetNotificationPreferencesResponse {

  List<NotificationPreferenceModel> items;
  GetNotificationPreferencesResponse.fromJson(Map<String, dynamic> map):
    this.items = _mapper(map["items"]);

  static List<NotificationPreferenceModel> _mapper(List<dynamic> list) {
    List<NotificationPreferenceModel> result = List.of([]);
    list.forEach((elem) {
      NotificationPreferenceModel model = NotificationPreferenceModel(
        elem["id"],
        extractNotificationPreferenceType(elem["type"]),
        elem["isActive"]
      );
      result.add(model);
    });
    return result;
  }

  static NotificationPreferenceTypeModel extractNotificationPreferenceType(String input) {
    return (input == "REMINDER") ? NotificationPreferenceTypeModel.REMINDER : (input == "GENERAL") ?
    NotificationPreferenceTypeModel.GENERAL : NotificationPreferenceTypeModel.SYSTEM;
  }
}