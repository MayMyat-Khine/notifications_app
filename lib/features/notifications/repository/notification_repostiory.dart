import 'package:notification_app_code_test/core/services/api_endpoints.dart';
import 'package:notification_app_code_test/core/services/api_service.dart';
import 'package:notification_app_code_test/features/notifications/models/notification_model.dart';

class NotificationRepository {
  final ApiService apiService;

  NotificationRepository(this.apiService);

  Future<List<NotificationModel>> getNotifications() async {
    final result = await apiService.getData(ApiEndpoints.notificationsList);
    return result.fold(
      (error) {
        throw Exception(error);
      },
      (response) {
        List<NotificationModel> noti = [];
        for (var item in response.data as Iterable) {
          noti.add(NotificationModel.fromJson(item));
        }
        return noti;
      },
    );
  }
}
