import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFF000002),
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/Untitled_design_(4).png',
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'testOnboarding': (data) async => TestOnboardingWidget(),
  'loginPage': (data) async => LoginPageWidget(),
  'viewPage': (data) async => hasMatchingParameters(data, {'completeTemp'})
      ? ViewPageWidget(
          completeTemp: getParameter(data, 'completeTemp'),
        )
      : NavBarPage(initialPage: 'viewPage'),
  'rulesBook': (data) async => RulesBookWidget(),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'notifications': (data) async => NavBarPage(initialPage: 'notifications'),
  'usersSearch': (data) async => UsersSearchWidget(),
  'MessagesPage': (data) async => NavBarPage(initialPage: 'MessagesPage'),
  'Appliances': (data) async => AppliancesWidget(),
  'Plumbing': (data) async => PlumbingWidget(),
  'Furniture': (data) async => FurnitureWidget(),
  'Electrical': (data) async => ElectricalWidget(),
  'Locksmith': (data) async => LocksmithWidget(),
  'Pestcontrol': (data) async => PestcontrolWidget(),
  'painting': (data) async => PaintingWidget(),
  'Others': (data) async => OthersWidget(),
  'Communal': (data) async => CommunalWidget(),
  'reviews': (data) async => ReviewsWidget(
        jobReviews: await getDocumentParameter(
            data, 'jobReviews', MaintenanceRecord.serializer),
      ),
  'testMoreInfo': (data) async => TestMoreInfoWidget(
        jobs: await getDocumentParameter(
            data, 'jobs', MaintenanceRecord.serializer),
      ),
  'newProfile': (data) async => NewProfileWidget(),
  'newSettings': (data) async => NavBarPage(initialPage: 'newSettings'),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
