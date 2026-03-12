part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsListLoading extends NotificationsState {}

class NotificationsListSuccess extends NotificationsState {
  final List<NotificationModel> notifications;
  const NotificationsListSuccess({required this.notifications});
  @override
  List<Object> get props => [notifications];
}

class NotificationsListFail extends NotificationsState {
  final String errorMsg;
  const NotificationsListFail({required this.errorMsg});
}
