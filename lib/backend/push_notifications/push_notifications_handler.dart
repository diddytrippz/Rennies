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
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

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
          color: FlutterFlowTheme.of(context).primaryColor,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/campus_logo_1.png',
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.75,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'onboarding': (data) async => OnboardingWidget(),
  'loginPage': (data) async => LoginPageWidget(),
  'verification': (data) async => VerificationWidget(),
  'settingsPage': (data) async => NavBarPage(initialPage: 'settingsPage'),
  'viewPage': (data) async => NavBarPage(initialPage: 'viewPage'),
  'rulesBook': (data) async => RulesBookWidget(),
  'moreInfo': (data) async => MoreInfoWidget(
        jobStatus: await getDocumentParameter(
            data, 'jobStatus', MaintenanceRecord.serializer),
      ),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'editProfile': (data) async => EditProfileWidget(),
  'MessagesPage': (data) async => NavBarPage(initialPage: 'MessagesPage'),
  'usersSearch': (data) async => NavBarPage(initialPage: 'usersSearch'),
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
