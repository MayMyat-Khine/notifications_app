part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  // const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class FetchNotificationsListEvent extends NotificationsEvent {}

class RefreshNotificationsListEvent extends NotificationsEvent {
  final Completer<void> completer;
  RefreshNotificationsListEvent(this.completer);
}

class ReadNotificationEvent extends NotificationsEvent {
  final String id;
  ReadNotificationEvent({required this.id});
}
