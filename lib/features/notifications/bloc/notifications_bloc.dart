import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification_app_code_test/features/notifications/models/notification_model.dart';
import 'package:notification_app_code_test/features/notifications/repository/notification_repostiory.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationRepository repo;
  NotificationsBloc({required this.repo}) : super(NotificationsInitial()) {
    on<FetchNotificationsListEvent>((event, emit) async {
      emit(NotificationsListLoading());
      try {
        final data = await repo.getNotifications();
        emit(NotificationsListSuccess(notifications: data));
      } catch (e) {
        emit(NotificationsListFail(errorMsg: e.toString()));
      }
    });

    on<RefreshNotificationsListEvent>((event, emit) async {
      try {
        final data = await repo.getNotifications();
        emit(NotificationsListSuccess(notifications: data));
      } catch (e) {
        emit(NotificationsListFail(errorMsg: e.toString()));
      } finally {
        event.completer.complete();
      }
    });

    on<ReadNotificationEvent>((event, emit) async {
      if (state is NotificationsListSuccess) {
        final currentState = state as NotificationsListSuccess;
        final updatedList = currentState.notifications.map((noti) {
          if (noti.id == event.id) {
            return noti.copyWith(isRead: true);
          }
          return noti;
        }).toList();

        emit(NotificationsListSuccess(notifications: updatedList));
        print("emitted");
      }
    });
  }
}
