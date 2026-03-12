import 'package:flutter/material.dart';
import 'package:notification_app_code_test/features/notifications/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: notification.isRead ? Colors.grey.shade100 : Colors.blue.shade50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Text(
                notification.date,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              notification.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            Text(
              notification.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
