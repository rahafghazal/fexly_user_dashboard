import 'package:flutter/material.dart';
class NotificationPage extends StatefulWidget {
  const new({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Notification page')),
    );
  }
}