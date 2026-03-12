import 'package:notification_app_code_test/core/utilities/date_extension.dart';

class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String date;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> data) {
    return NotificationModel(
      id: data['id'].toString(),
      title: data['title'],
      content: data['body'],
      isRead: data['isRead'] ?? false,
      date: data['date'] ?? DateTime.now().dmyhmFormat,
    );
  }

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      title: title,
      content: content,
      isRead: isRead ?? this.isRead,
      date: date,
    );
  }
}
