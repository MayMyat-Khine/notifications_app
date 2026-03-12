import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app_code_test/core/services/api_service.dart';
import 'package:notification_app_code_test/features/notifications/bloc/notifications_bloc.dart';
import 'package:notification_app_code_test/features/notifications/repository/notification_repostiory.dart';
import 'package:notification_app_code_test/features/notifications/views/notifications_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              NotificationsBloc(repo: NotificationRepository(ApiService())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notifications List App',
        home: const NotificationsListPage(),
      ),
    );
  }
}
