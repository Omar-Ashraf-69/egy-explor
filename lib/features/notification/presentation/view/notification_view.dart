import 'package:egy_exlpor/features/notification/presentation/view/widgets/notification_view_%20body.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
    static const String routeName = '/notification_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationViewBody(),
    );
  }
}