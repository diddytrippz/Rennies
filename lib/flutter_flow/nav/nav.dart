import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  EasyTenantFirebaseUser initialUser;
  EasyTenantFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation == null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(EasyTenantFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
          routes: [
            FFRoute(
              name: 'onboarding',
              path: 'onboarding',
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'loginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'verification',
              path: 'verification',
              builder: (context, params) => VerificationWidget(),
            ),
            FFRoute(
              name: 'homePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'homePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'settingsPage',
              path: 'settingsPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'settingsPage')
                  : SettingsPageWidget(),
            ),
            FFRoute(
              name: 'viewPage',
              path: 'viewPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'viewPage')
                  : ViewPageWidget(),
            ),
            FFRoute(
              name: 'rulesBook',
              path: 'rulesBook',
              builder: (context, params) => RulesBookWidget(),
            ),
            FFRoute(
              name: 'moreInfo',
              path: 'moreInfo',
              asyncParams: {
                'jobStatus':
                    getDoc('maintenance', MaintenanceRecord.serializer),
              },
              builder: (context, params) => MoreInfoWidget(
                jobStatus: params.getParam('jobStatus', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, 'chats'),
              ),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'MessagesPage',
              path: 'messagesPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MessagesPage')
                  : MessagesPageWidget(),
            ),
            FFRoute(
              name: 'usersSearch',
              path: 'usersSearch',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'usersSearch')
                  : UsersSearchWidget(),
            ),
            FFRoute(
              name: 'Appliances',
              path: 'appliances',
              builder: (context, params) => AppliancesWidget(),
            ),
            FFRoute(
              name: 'Plumbing',
              path: 'plumbing',
              builder: (context, params) => PlumbingWidget(),
            ),
            FFRoute(
              name: 'Furniture',
              path: 'furniture',
              builder: (context, params) => FurnitureWidget(),
            ),
            FFRoute(
              name: 'Electrical',
              path: 'electrical',
              builder: (context, params) => ElectricalWidget(),
            ),
            FFRoute(
              name: 'Locksmith',
              path: 'locksmith',
              builder: (context, params) => LocksmithWidget(),
            ),
            FFRoute(
              name: 'Pestcontrol',
              path: 'pestcontrol',
              builder: (context, params) => PestcontrolWidget(),
            ),
            FFRoute(
              name: 'painting',
              path: 'painting',
              builder: (context, params) => PaintingWidget(),
            ),
            FFRoute(
              name: 'Others',
              path: 'others',
              builder: (context, params) => OthersWidget(),
            ),
            FFRoute(
              name: 'Communal',
              path: 'communal',
              builder: (context, params) => CommunalWidget(),
            ),
            FFRoute(
              name: 'reviews',
              path: 'reviews',
              asyncParams: {
                'jobReviews':
                    getDoc('maintenance', MaintenanceRecord.serializer),
              },
              builder: (context, params) => ReviewsWidget(
                jobReviews: params.getParam('jobReviews', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 300),
      );
}
