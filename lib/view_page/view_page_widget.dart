import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../test_more_info/test_more_info_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ViewPageWidget extends StatefulWidget {
  const ViewPageWidget({
    Key? key,
    this.completeTemp,
  }) : super(key: key);

  final double? completeTemp;

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget>
    with TickerProviderStateMixin {
  Completer<List<MaintenanceRecord>>? _firestoreRequestCompleter1;
  Completer<List<MaintenanceRecord>>? _firestoreRequestCompleter2;
  Completer<List<MaintenanceRecord>>? _firestoreRequestCompleter3;
  Completer<List<MaintenanceRecord>>? _firestoreRequestCompleter4;
  DateTimeRange? calendarSelectedDay;
  List<MaintenanceRecord> simpleSearchResults = [];
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 800,
      delay: 250,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.18,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController = TextEditingController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'viewPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('VIEW_FloatingActionButton_9nto5evo_ON_TA');
          logFirebaseEvent('FloatingActionButton_Navigate-To');
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: NavBarPage(initialPage: 'homePage'),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).mellow,
        elevation: 8,
        child: Icon(
          Icons.home_rounded,
          color: Colors.white,
          size: 26,
        ),
      ).animated([animationsMap['floatingActionButtonOnPageLoadAnimation']!]),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  desktop: false,
                ))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 12, 18, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowCalendar(
                            color: Color(0xFFFFBA00),
                            iconColor: Color(0xE1F5F5F5),
                            weekFormat: true,
                            weekStartsMonday: false,
                            onChange: (DateTimeRange? newSelectedDate) {
                              setState(
                                  () => calendarSelectedDay = newSelectedDate);
                            },
                            titleStyle: TextStyle(
                              color: Color(0xE1FFFFFF),
                            ),
                            dayOfWeekStyle: TextStyle(
                              color: Color(0xE1FFFFFF),
                            ),
                            dateStyle: TextStyle(
                              color: Colors.white,
                            ),
                            selectedDateStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            inactiveDateStyle: TextStyle(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 400),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .campusGrey,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'g6o86hf9' /* Search here... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .campusGrey,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFF57636C),
                                          size: 20,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .campusGrey,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 8, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VIEW_PAGE_PAGE_SEARCH_BTN_ON_TAP');
                                      logFirebaseEvent('Button_Simple-Search');
                                      await queryMaintenanceRecordOnce()
                                          .then(
                                            (records) => simpleSearchResults =
                                                TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem(
                                                        record,
                                                        [record.issue!]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(
                                                        textController!.text)
                                                    .map((r) => r.object)
                                                    .take(5)
                                                    .toList(),
                                          )
                                          .onError((_, __) =>
                                              simpleSearchResults = [])
                                          .whenComplete(() => setState(() {}));
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '16xkmm6b' /* Search */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: Colors.white,
                                          ),
                                      elevation: 2,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if ((valueOrDefault(
                                      currentUserDocument?.role, '')) ==
                                  'Tenant')
                                Expanded(
                                  flex: 2,
                                  child: AuthUserStreamWidget(
                                    child: DefaultTabController(
                                      length: 3,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                Color(0xFF6E6E6E),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'fxusdesr' /* Submitted */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'xliyc9jb' /* Pending */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nj9umfeo' /* Completed */,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 12),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'x8cw3w69' /* Search results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        future: (_firestoreRequestCompleter1 ??=
                                                                Completer<
                                                                    List<
                                                                        MaintenanceRecord>>()
                                                                  ..complete(
                                                                      queryMaintenanceRecordOnce(
                                                                    queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                        .where(
                                                                            'status',
                                                                            isEqualTo:
                                                                                'Submitted')
                                                                        .where(
                                                                            'email',
                                                                            isEqualTo:
                                                                                currentUserEmail)
                                                                        .orderBy(
                                                                            'created_time',
                                                                            descending:
                                                                                true),
                                                                  )))
                                                            .future,
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewSubSTDMaintenanceRecordList =
                                                              snapshot.data!;
                                                          if (listViewSubSTDMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/undraw_no_data_re_kwbl.png',
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            );
                                                          }
                                                          return CustomRefreshIndicator(
                                                            onRefresh:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_ListViewSubSTD_ON_PULL_TO_REFRESH');
                                                              logFirebaseEvent(
                                                                  'ListViewSubSTD_Refresh-Database-Request');
                                                              setState(() =>
                                                                  _firestoreRequestCompleter1 =
                                                                      null);
                                                              await waitForFirestoreRequestCompleter1();
                                                            },
                                                            onStateChanged: (c) =>
                                                                c.didChange(
                                                                        from: IndicatorState
                                                                            .loading)
                                                                    ? setState(
                                                                        () {})
                                                                    : null,
                                                            builder: (context,
                                                                    child,
                                                                    controller) =>
                                                                Stack(
                                                              children: [
                                                                if (controller
                                                                    .isLoading)
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                Color(0xFF1F78FF),
                                                                            size:
                                                                                50,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: controller
                                                                            .isLoading
                                                                        ? 50
                                                                        : 0.0,
                                                                  ),
                                                                  child: child,
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewSubSTDMaintenanceRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewSubSTDIndex) {
                                                                final listViewSubSTDMaintenanceRecord =
                                                                    listViewSubSTDMaintenanceRecordList[
                                                                        listViewSubSTDIndex];
                                                                return InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'VIEW_PAGE_PAGE_ListTile_eb8h3glo_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'ListTile_Navigate-To');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        reverseDuration:
                                                                            Duration(milliseconds: 300),
                                                                        child:
                                                                            TestMoreInfoWidget(
                                                                          jobs:
                                                                              listViewSubSTDMaintenanceRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Slidable(
                                                                    actionPane:
                                                                        const SlidableScrollActionPane(),
                                                                    secondaryActions: [
                                                                      IconSlideAction(
                                                                        caption:
                                                                            FFLocalizations.of(context).getText(
                                                                          '47qcs9t7' /* Delete */,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .campusRed,
                                                                        icon: Icons
                                                                            .delete_outline,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'VIEW_SlidableActionWidget_aynk2i2a_ON_TA');
                                                                          logFirebaseEvent(
                                                                              'SlidableActionWidget_Alert-Dialog');
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('You are about to delete all items. Do you wish to continue?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('Cancel'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('OK'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            logFirebaseEvent('SlidableActionWidget_Backend-Call');
                                                                            await listViewSubSTDMaintenanceRecord!.reference.delete();
                                                                          } else {
                                                                            return;
                                                                          }

                                                                          logFirebaseEvent(
                                                                              'SlidableActionWidget_Show-Snack-Bar');
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                '1 item moved to bin',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                    child:
                                                                        ListTile(
                                                                      leading:
                                                                          Icon(
                                                                        Icons
                                                                            .account_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35,
                                                                      ),
                                                                      title:
                                                                          Text(
                                                                        listViewSubSTDMaintenanceRecord!
                                                                            .issue!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title2
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16,
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        '${dateTimeFormat('MMMMEEEEd', listViewSubSTDMaintenanceRecord!.createdTime)} ${dateTimeFormat('jm', listViewSubSTDMaintenanceRecord!.createdTime)}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              fontSize: 14,
                                                                            ),
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_right_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      tileColor:
                                                                          Color(
                                                                              0x00FFFFFF),
                                                                      dense:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4e2bu1eh' /* Search results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: FutureBuilder<
                                                            List<
                                                                MaintenanceRecord>>(
                                                          future: (_firestoreRequestCompleter2 ??=
                                                                  Completer<
                                                                      List<
                                                                          MaintenanceRecord>>()
                                                                    ..complete(
                                                                        queryMaintenanceRecordOnce(
                                                                      queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                          .where(
                                                                              'status',
                                                                              isEqualTo:
                                                                                  'Pending')
                                                                          .where(
                                                                              'email',
                                                                              isEqualTo:
                                                                                  currentUserEmail)
                                                                          .orderBy(
                                                                              'created_time',
                                                                              descending: true),
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 60,
                                                                  height: 60,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 60,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<MaintenanceRecord>
                                                                listViewPendSTDMaintenanceRecordList =
                                                                snapshot.data!;
                                                            if (listViewPendSTDMaintenanceRecordList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/undraw_no_data_re_kwbl.svg',
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.5,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              );
                                                            }
                                                            return CustomRefreshIndicator(
                                                              onRefresh:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'VIEW_ListViewPendSTD_ON_PULL_TO_REFRESH');
                                                                logFirebaseEvent(
                                                                    'ListViewPendSTD_Refresh-Database-Request');
                                                                setState(() =>
                                                                    _firestoreRequestCompleter2 =
                                                                        null);
                                                                await waitForFirestoreRequestCompleter2();
                                                              },
                                                              onStateChanged: (c) =>
                                                                  c.didChange(
                                                                          from: IndicatorState
                                                                              .loading)
                                                                      ? setState(
                                                                          () {})
                                                                      : null,
                                                              builder: (context,
                                                                      child,
                                                                      controller) =>
                                                                  Stack(
                                                                children: [
                                                                  if (controller
                                                                      .isLoading)
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: Color(0xFF1F78FF),
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      top: controller
                                                                              .isLoading
                                                                          ? 50
                                                                          : 0.0,
                                                                    ),
                                                                    child:
                                                                        child,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewPendSTDMaintenanceRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewPendSTDIndex) {
                                                                  final listViewPendSTDMaintenanceRecord =
                                                                      listViewPendSTDMaintenanceRecordList[
                                                                          listViewPendSTDIndex];
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'VIEW_PAGE_PAGE_ListTile_gznh7u5n_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ListTile_Navigate-To');
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          reverseDuration:
                                                                              Duration(milliseconds: 300),
                                                                          child:
                                                                              TestMoreInfoWidget(
                                                                            jobs:
                                                                                listViewPendSTDMaintenanceRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      leading:
                                                                          Icon(
                                                                        Icons
                                                                            .account_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35,
                                                                      ),
                                                                      title:
                                                                          Text(
                                                                        listViewPendSTDMaintenanceRecord!
                                                                            .issue!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title1
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        '${dateTimeFormat('MMMMEEEEd', listViewPendSTDMaintenanceRecord!.createdTime)} ${dateTimeFormat('jm', listViewPendSTDMaintenanceRecord!.createdTime)}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              fontSize: 14,
                                                                            ),
                                                                      ),
                                                                      tileColor:
                                                                          Color(
                                                                              0x00F5F5F5),
                                                                      dense:
                                                                          true,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '9zcs84ro' /* Search results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        future: (_firestoreRequestCompleter3 ??=
                                                                Completer<
                                                                    List<
                                                                        MaintenanceRecord>>()
                                                                  ..complete(
                                                                      queryMaintenanceRecordOnce(
                                                                    queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                        .where(
                                                                            'status',
                                                                            isEqualTo:
                                                                                'Completed')
                                                                        .where(
                                                                            'email',
                                                                            isEqualTo:
                                                                                currentUserEmail)
                                                                        .orderBy(
                                                                            'created_time',
                                                                            descending:
                                                                                true),
                                                                  )))
                                                            .future,
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewCompSTDMaintenanceRecordList =
                                                              snapshot.data!;
                                                          if (listViewCompSTDMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/undraw_no_data_re_kwbl.png',
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                              ),
                                                            );
                                                          }
                                                          return CustomRefreshIndicator(
                                                            onRefresh:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_ListViewCompSTD_ON_PULL_TO_REFRESH');
                                                              logFirebaseEvent(
                                                                  'ListViewCompSTD_Refresh-Database-Request');
                                                              setState(() =>
                                                                  _firestoreRequestCompleter3 =
                                                                      null);
                                                              await waitForFirestoreRequestCompleter3();
                                                            },
                                                            onStateChanged: (c) =>
                                                                c.didChange(
                                                                        from: IndicatorState
                                                                            .loading)
                                                                    ? setState(
                                                                        () {})
                                                                    : null,
                                                            builder: (context,
                                                                    child,
                                                                    controller) =>
                                                                Stack(
                                                              children: [
                                                                if (controller
                                                                    .isLoading)
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                Color(0xFF1F78FF),
                                                                            size:
                                                                                50,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: controller
                                                                            .isLoading
                                                                        ? 50
                                                                        : 0.0,
                                                                  ),
                                                                  child: child,
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewCompSTDMaintenanceRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewCompSTDIndex) {
                                                                final listViewCompSTDMaintenanceRecord =
                                                                    listViewCompSTDMaintenanceRecordList[
                                                                        listViewCompSTDIndex];
                                                                return InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'VIEW_PAGE_PAGE_ListTile_asqyo1jd_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'ListTile_Navigate-To');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        reverseDuration:
                                                                            Duration(milliseconds: 300),
                                                                        child:
                                                                            TestMoreInfoWidget(
                                                                          jobs:
                                                                              listViewCompSTDMaintenanceRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      Icons
                                                                          .account_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 35,
                                                                    ),
                                                                    title: Text(
                                                                      listViewCompSTDMaintenanceRecord!
                                                                          .issue!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      '${dateTimeFormat('MMMMEEEEd', listViewCompSTDMaintenanceRecord!.createdTime)} ${dateTimeFormat('jm', listViewCompSTDMaintenanceRecord!.createdTime)}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 20,
                                                                    ),
                                                                    tileColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    dense: true,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if ((valueOrDefault(
                                      currentUserDocument?.role, '')) ==
                                  'Admin')
                                Expanded(
                                  child: AuthUserStreamWidget(
                                    child: DefaultTabController(
                                      length: 3,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                Color(0xFF6E6E6E),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4mu7n5uz' /* Submitted */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '6firyr35' /* Pending */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'n3dnbo6v' /* Completed */,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'epsh7pdm' /* Search results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        future: (_firestoreRequestCompleter4 ??=
                                                                Completer<
                                                                    List<
                                                                        MaintenanceRecord>>()
                                                                  ..complete(
                                                                      queryMaintenanceRecordOnce(
                                                                    queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                        .where(
                                                                            'status',
                                                                            isEqualTo:
                                                                                'Submitted')
                                                                        .where(
                                                                            'building',
                                                                            isEqualTo: valueOrDefault(
                                                                                currentUserDocument
                                                                                    ?.building,
                                                                                ''))
                                                                        .where(
                                                                            'isDone',
                                                                            isEqualTo:
                                                                                false)
                                                                        .orderBy(
                                                                            'created_time',
                                                                            descending:
                                                                                true),
                                                                  )))
                                                            .future,
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewSubmitMaintenanceRecordList =
                                                              snapshot.data!;
                                                          if (listViewSubmitMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/undraw_no_data_re_kwbl.png',
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewSubmitMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewSubmitIndex) {
                                                              final listViewSubmitMaintenanceRecord =
                                                                  listViewSubmitMaintenanceRecordList[
                                                                      listViewSubmitIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'VIEW_PAGE_PAGE_ListTile_cblb6ffj_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'ListTile_Navigate-To');
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      reverseDuration:
                                                                          Duration(
                                                                              milliseconds: 300),
                                                                      child:
                                                                          TestMoreInfoWidget(
                                                                        jobs:
                                                                            listViewSubmitMaintenanceRecord,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Slidable(
                                                                  actionPane:
                                                                      const SlidableScrollActionPane(),
                                                                  secondaryActions: [
                                                                    IconSlideAction(
                                                                      caption: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'zset6avm' /* Complete */,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .campusRed,
                                                                      icon: Icons
                                                                          .logout,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'VIEW_SlidableActionWidget_sug5r641_ON_TA');
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Backend-Call');

                                                                        final maintenanceUpdateData =
                                                                            createMaintenanceRecordData(
                                                                          status:
                                                                              'Pending',
                                                                          assigned:
                                                                              currentUserDisplayName,
                                                                        );
                                                                        await listViewSubmitMaintenanceRecord!
                                                                            .reference
                                                                            .update(maintenanceUpdateData);
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Refresh-Database-Re');
                                                                        setState(() =>
                                                                            _firestoreRequestCompleter4 =
                                                                                null);
                                                                        await waitForFirestoreRequestCompleter4();
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Show-Snack-Bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Item successfully completed',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      Icons
                                                                          .account_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 35,
                                                                    ),
                                                                    title: Text(
                                                                      listViewSubmitMaintenanceRecord!
                                                                          .issue!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      listViewSubmitMaintenanceRecord!
                                                                          .room!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFB91D13),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 20,
                                                                    ),
                                                                    tileColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    dense: true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'xv02t8u2' /* Search results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        stream:
                                                            queryMaintenanceRecord(
                                                          queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                              .where('status',
                                                                  isEqualTo:
                                                                      'Pending')
                                                              .where('building',
                                                                  isEqualTo: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.building,
                                                                      ''))
                                                              .where('isDone',
                                                                  isEqualTo:
                                                                      false)
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewPendingMaintenanceRecordList =
                                                              snapshot.data!;
                                                          if (listViewPendingMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/undraw_no_data_re_kwbl.png',
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewPendingMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewPendingIndex) {
                                                              final listViewPendingMaintenanceRecord =
                                                                  listViewPendingMaintenanceRecordList[
                                                                      listViewPendingIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'VIEW_PAGE_PAGE_ListTile_gfs86ivb_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'ListTile_Navigate-To');
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      reverseDuration:
                                                                          Duration(
                                                                              milliseconds: 300),
                                                                      child:
                                                                          TestMoreInfoWidget(
                                                                        jobs:
                                                                            listViewPendingMaintenanceRecord,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Slidable(
                                                                  actionPane:
                                                                      const SlidableScrollActionPane(),
                                                                  secondaryActions: [
                                                                    IconSlideAction(
                                                                      caption: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'r52o7k9c' /* Reject */,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      icon: FFIcons
                                                                          .kthumbsDowns,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'VIEW_SlidableActionWidget_se7xu763_ON_TA');
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Backend-Call');

                                                                        final maintenanceUpdateData =
                                                                            createMaintenanceRecordData(
                                                                          status:
                                                                              'Submitted',
                                                                        );
                                                                        await listViewPendingMaintenanceRecord!
                                                                            .reference
                                                                            .update(maintenanceUpdateData);
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Show-Snack-Bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Item rejected',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    IconSlideAction(
                                                                      caption: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ib1fouvv' /* Complete */,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .campusRed,
                                                                      icon: Icons
                                                                          .logout,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'VIEW_SlidableActionWidget_6qww6kpi_ON_TA');
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Backend-Call');

                                                                        final maintenanceUpdateData =
                                                                            createMaintenanceRecordData(
                                                                          status:
                                                                              'Completed',
                                                                          updateTime:
                                                                              getCurrentTimestamp,
                                                                        );
                                                                        await listViewPendingMaintenanceRecord!
                                                                            .reference
                                                                            .update(maintenanceUpdateData);
                                                                        // pushNotifications
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_pushNotifications');
                                                                        triggerPushNotification(
                                                                          notificationTitle:
                                                                              'Maintenance ticket Status',
                                                                          notificationText:
                                                                              'Your maintenance ticket has been completed. Click here to leave a review ',
                                                                          notificationImageUrl:
                                                                              FFAppState().caLogo,
                                                                          notificationSound:
                                                                              'default',
                                                                          userRefs: [
                                                                            listViewPendingMaintenanceRecord!.userRec!
                                                                          ],
                                                                          initialPageName:
                                                                              'viewPage',
                                                                          parameterData: {},
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Show-Snack-Bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Item successfully completed',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      Icons
                                                                          .account_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 35,
                                                                    ),
                                                                    title: Text(
                                                                      listViewPendingMaintenanceRecord!
                                                                          .issue!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      listViewPendingMaintenanceRecord!
                                                                          .room!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Color(0xFFEFB701),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 20,
                                                                    ),
                                                                    tileColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    dense: true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'afgqhb9l' /* Search results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          List<
                                                              MaintenanceRecord>>(
                                                        future:
                                                            queryMaintenanceRecordOnce(
                                                          queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                              .where('building',
                                                                  isEqualTo: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.building,
                                                                      ''))
                                                              .where('status',
                                                                  isEqualTo:
                                                                      'Completed')
                                                              .orderBy(
                                                                  'created_time',
                                                                  descending:
                                                                      true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 60,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MaintenanceRecord>
                                                              listViewCompletedMaintenanceRecordList =
                                                              snapshot.data!;
                                                          if (listViewCompletedMaintenanceRecordList
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/undraw_no_data_re_kwbl.png',
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.5,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewCompletedMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewCompletedIndex) {
                                                              final listViewCompletedMaintenanceRecord =
                                                                  listViewCompletedMaintenanceRecordList[
                                                                      listViewCompletedIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            5,
                                                                            4,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'VIEW_PAGE_PAGE_Card_ngil69ok_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Card_Navigate-To');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .bottomToTop,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                        reverseDuration:
                                                                            Duration(milliseconds: 300),
                                                                        child:
                                                                            TestMoreInfoWidget(
                                                                          jobs:
                                                                              listViewCompletedMaintenanceRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    elevation:
                                                                        0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.account_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                35,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                    child: Text(
                                                                                      listViewCompletedMaintenanceRecord!.issue!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    listViewCompletedMaintenanceRecord!.room!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: Color(0xFF0C8450),
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future waitForFirestoreRequestCompleter1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
