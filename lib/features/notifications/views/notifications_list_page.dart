import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app_code_test/features/notifications/bloc/notifications_bloc.dart';
import '../widgets/notification_card.dart';
import '../widgets/loading_widget.dart';

class NotificationsListPage extends StatefulWidget {
  const NotificationsListPage({super.key});

  @override
  State<NotificationsListPage> createState() => _NotificationsListPageState();
}

class _NotificationsListPageState extends State<NotificationsListPage> {
  late NotificationsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<NotificationsBloc>();
    _bloc.add(FetchNotificationsListEvent());
  }

  Future<void> _onRefresh() async {
    final completer = Completer<void>();
    _bloc.add(RefreshNotificationsListEvent(completer));
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsListLoading) {
            return const LoadingWidget();
          }
          if (state is NotificationsListSuccess) {
            if (state.notifications.isEmpty) {
              return const Text("No notifications");
            }
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: state.notifications[index].isRead
                        ? null
                        : () {
                            _bloc.add(
                              ReadNotificationEvent(
                                id: state.notifications[index].id,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Marked as read")),
                            );
                          },
                    child: NotificationCard(
                      notification: state.notifications[index],
                    ),
                  );
                },
              ),
            );
          }

          if (state is NotificationsListFail) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text("Failed to load notifications")),
                TextButton(
                  onPressed: () {
                    _bloc.add(FetchNotificationsListEvent());
                  },
                  child: Text(
                    "Try again",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
