import 'package:professors/models/notification_preference_type.model.dart';

class NotificationPreferenceModel {
  int id;
  NotificationPreferenceTypeModel type;
  bool isActive;
  NotificationPreferenceModel(this.id, this.type, this.isActive);
}