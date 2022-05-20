import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';

class ViewPageWidget extends StatefulWidget {
  const ViewPageWidget({Key key}) : super(key: key);

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget>
    with TickerProviderStateMixin {
  DateTimeRange calendarSelectedDay;
  List<MaintenanceRecord> simpleSearchResults = [];
  TextEditingController textController;
  PagingController<DocumentSnapshot, MaintenanceRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 800,
      delay: 250,
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
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('FloatingActionButton_ON_TAP');
          logFirebaseEvent('FloatingActionButton_Navigate-To');
          context.pushNamed('homePage');
        },
        backgroundColor: Color(0xFF4A31F2),
        elevation: 8,
        child: Icon(
          Icons.edit_sharp,
          color: Colors.white,
          size: 24,
        ),
      ).animated([animationsMap['floatingActionButtonOnPageLoadAnimation']]),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18, 12, 18, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterFlowCalendar(
                        color: Color(0xFF4A31F2),
                        iconColor: FlutterFlowTheme.of(context).campusGrey,
                        weekFormat: true,
                        weekStartsMonday: false,
                        onChange: (DateTimeRange newSelectedDate) {
                          setState(() => calendarSelectedDay = newSelectedDate);
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
                        ),
                        inactiveDateStyle: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      Container(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
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
                                          color: FlutterFlowTheme.of(context)
                                              .campusGrey,
                                        ),
                                    hintText: 'Search here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .campusGrey,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent('Button_ON_TAP');
                                  logFirebaseEvent('Button_Simple-Search');
                                  await queryMaintenanceRecordOnce()
                                      .then(
                                        (records) => simpleSearchResults =
                                            TextSearch(
                                          records
                                              .map(
                                                (record) => TextSearchItem(
                                                    record, [record.issue]),
                                              )
                                              .toList(),
                                        )
                                                .search(textController.text)
                                                .map((r) => r.object)
                                                .take(5)
                                                .toList(),
                                      )
                                      .onError(
                                          (_, __) => simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));
                                },
                                text: 'Search',
                                options: FFButtonOptions(
                                  width: 100,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if ((valueOrDefault(
                                      currentUserDocument?.role, '')) ==
                                  'Tenant')
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
                                                text: 'Submitted',
                                              ),
                                              Tab(
                                                text: 'Pending',
                                              ),
                                              Tab(
                                                text: 'Completed',
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
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Search results',
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
                                                          queryBuilder: (maintenanceRecord) =>
                                                              maintenanceRecord
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
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
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
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ListTile_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'ListTile_Navigate-To');
                                                                  context
                                                                      .pushNamed(
                                                                    'moreInfo',
                                                                    queryParams:
                                                                        {
                                                                      'jobStatus': serializeParam(
                                                                          listViewMaintenanceRecord,
                                                                          ParamType
                                                                              .Document),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'jobStatus':
                                                                          listViewMaintenanceRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: Slidable(
                                                                  actionPane:
                                                                      const SlidableScrollActionPane(),
                                                                  secondaryActions: [
                                                                    IconSlideAction(
                                                                      caption:
                                                                          'Delete',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .campusRed,
                                                                      icon: Icons
                                                                          .delete_outline,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_ON_TAP');
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
                                                                          logFirebaseEvent(
                                                                              'SlidableActionWidget_Backend-Call');
                                                                          await listViewMaintenanceRecord
                                                                              .reference
                                                                              .delete();
                                                                        }
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Show-Snack-Bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              '1 item moved to bin',
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
                                                                      listViewMaintenanceRecord
                                                                          .issue,
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
                                                                          ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
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
                                                            'Search results',
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
                                                        child: StreamBuilder<
                                                            List<
                                                                MaintenanceRecord>>(
                                                          stream:
                                                              queryMaintenanceRecord(
                                                            queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                .where('status',
                                                                    isEqualTo:
                                                                        'Pending')
                                                                .where('email',
                                                                    isEqualTo:
                                                                        currentUserEmail)
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
                                                                listViewMaintenanceRecordList =
                                                                snapshot.data;
                                                            if (listViewMaintenanceRecordList
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
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewMaintenanceRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewMaintenanceRecord =
                                                                    listViewMaintenanceRecordList[
                                                                        listViewIndex];
                                                                return InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ListTile_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'ListTile_Navigate-To');
                                                                    context
                                                                        .pushNamed(
                                                                      'moreInfo',
                                                                      queryParams:
                                                                          {
                                                                        'jobStatus': serializeParam(
                                                                            listViewMaintenanceRecord,
                                                                            ParamType.Document),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'jobStatus':
                                                                            listViewMaintenanceRecord,
                                                                      },
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
                                                                      listViewMaintenanceRecord
                                                                          .issue,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title1
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
                                                                      '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
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
                                                                    tileColor:
                                                                        Color(
                                                                            0x00F5F5F5),
                                                                    dense: true,
                                                                  ),
                                                                );
                                                              },
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
                                                            'Search results',
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
                                                          queryBuilder: (maintenanceRecord) =>
                                                              maintenanceRecord
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
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
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
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ListTile_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'ListTile_Navigate-To');
                                                                  context
                                                                      .pushNamed(
                                                                    'moreInfo',
                                                                    queryParams:
                                                                        {
                                                                      'jobStatus': serializeParam(
                                                                          listViewMaintenanceRecord,
                                                                          ParamType
                                                                              .Document),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'jobStatus':
                                                                          listViewMaintenanceRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .account_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 35,
                                                                  ),
                                                                  title: Text(
                                                                    listViewMaintenanceRecord
                                                                        .issue,
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
                                                                    '${dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime)} ${dateTimeFormat('jm', listViewMaintenanceRecord.createdTime)}',
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
                                                                  tileColor: Color(
                                                                      0x00FFFFFF),
                                                                  dense: true,
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
                                                text: 'Submitted',
                                              ),
                                              Tab(
                                                text: 'Pending',
                                              ),
                                              Tab(
                                                text: 'Completed',
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
                                                            'Search results',
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
                                                                      'Submitted')
                                                              .where('building',
                                                                  isEqualTo: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.building,
                                                                              '') !=
                                                                          ''
                                                                      ? valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.building,
                                                                          '')
                                                                      : null)
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
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
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
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ListTile_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'ListTile_Navigate-To');
                                                                  context
                                                                      .pushNamed(
                                                                    'moreInfo',
                                                                    queryParams:
                                                                        {
                                                                      'jobStatus': serializeParam(
                                                                          listViewMaintenanceRecord,
                                                                          ParamType
                                                                              .Document),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'jobStatus':
                                                                          listViewMaintenanceRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: Slidable(
                                                                  actionPane:
                                                                      const SlidableScrollActionPane(),
                                                                  secondaryActions: [
                                                                    IconSlideAction(
                                                                      caption:
                                                                          'Complete',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .campusRed,
                                                                      icon: Icons
                                                                          .logout,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'SlidableActionWidget_Backend-Call');

                                                                        final maintenanceUpdateData =
                                                                            createMaintenanceRecordData(
                                                                          status:
                                                                              'Pending',
                                                                          assigned:
                                                                              currentUserDisplayName,
                                                                        );
                                                                        await listViewMaintenanceRecord
                                                                            .reference
                                                                            .update(maintenanceUpdateData);
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
                                                                      listViewMaintenanceRecord
                                                                          .issue,
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
                                                                      listViewMaintenanceRecord
                                                                          .room,
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
                                                            'Search results',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: PagedListView<
                                                          DocumentSnapshot<
                                                              Object>,
                                                          MaintenanceRecord>(
                                                        pagingController: () {
                                                          final Query<Object> Function(
                                                                  Query<Object>)
                                                              queryBuilder =
                                                              (maintenanceRecord) => maintenanceRecord
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Pending')
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
                                                                          true);
                                                          if (_pagingController !=
                                                              null) {
                                                            final query = queryBuilder(
                                                                MaintenanceRecord
                                                                    .collection);
                                                            if (query !=
                                                                _pagingQuery) {
                                                              // The query has changed
                                                              _pagingQuery =
                                                                  query;
                                                              _streamSubscriptions
                                                                  .forEach((s) =>
                                                                      s?.cancel());
                                                              _streamSubscriptions
                                                                  .clear();
                                                              _pagingController
                                                                  .refresh();
                                                            }
                                                            return _pagingController;
                                                          }

                                                          _pagingController =
                                                              PagingController(
                                                                  firstPageKey:
                                                                      null);
                                                          _pagingQuery = queryBuilder(
                                                              MaintenanceRecord
                                                                  .collection);
                                                          _pagingController
                                                              .addPageRequestListener(
                                                                  (nextPageMarker) {
                                                            queryMaintenanceRecordPage(
                                                              queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'Pending')
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
                                                              nextPageMarker:
                                                                  nextPageMarker,
                                                              pageSize: 10,
                                                              isStream: true,
                                                            ).then((page) {
                                                              _pagingController
                                                                  .appendPage(
                                                                page.data,
                                                                page.nextPageMarker,
                                                              );
                                                              final streamSubscription =
                                                                  page
                                                                      .dataStream
                                                                      ?.listen(
                                                                          (data) {
                                                                final itemIndexes = _pagingController
                                                                    .itemList
                                                                    .asMap()
                                                                    .map((k,
                                                                            v) =>
                                                                        MapEntry(
                                                                            v.reference.id,
                                                                            k));
                                                                data.forEach(
                                                                    (item) {
                                                                  final index =
                                                                      itemIndexes[item
                                                                          .reference
                                                                          .id];
                                                                  if (index !=
                                                                      null) {
                                                                    _pagingController
                                                                        .itemList
                                                                        .replaceRange(
                                                                            index,
                                                                            index + 1,
                                                                            [
                                                                          item
                                                                        ]);
                                                                  }
                                                                });
                                                                setState(() {});
                                                              });
                                                              _streamSubscriptions
                                                                  .add(
                                                                      streamSubscription);
                                                            });
                                                          });
                                                          return _pagingController;
                                                        }(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        builderDelegate:
                                                            PagedChildBuilderDelegate<
                                                                MaintenanceRecord>(
                                                          // Customize what your widget looks like when it's loading the first page.
                                                          firstPageProgressIndicatorBuilder:
                                                              (_) => Center(
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
                                                          ),
                                                          noItemsFoundIndicatorBuilder:
                                                              (_) => Center(
                                                            child: Image.asset(
                                                              'assets/images/undraw_no_data_re_kwbl.png',
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          itemBuilder: (context,
                                                              _,
                                                              listViewIndex) {
                                                            final listViewMaintenanceRecord =
                                                                _pagingController
                                                                        .itemList[
                                                                    listViewIndex];
                                                            return InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ListTile_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'ListTile_Navigate-To');
                                                                context
                                                                    .pushNamed(
                                                                  'moreInfo',
                                                                  queryParams: {
                                                                    'jobStatus': serializeParam(
                                                                        listViewMaintenanceRecord,
                                                                        ParamType
                                                                            .Document),
                                                                  }.withoutNulls,
                                                                  extra: <
                                                                      String,
                                                                      dynamic>{
                                                                    'jobStatus':
                                                                        listViewMaintenanceRecord,
                                                                  },
                                                                );
                                                              },
                                                              child: Slidable(
                                                                actionPane:
                                                                    const SlidableScrollActionPane(),
                                                                secondaryActions: [
                                                                  IconSlideAction(
                                                                    caption:
                                                                        'Reject',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    icon: FFIcons
                                                                        .kthumbsDowns,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_Backend-Call');

                                                                      final maintenanceUpdateData =
                                                                          createMaintenanceRecordData(
                                                                        status:
                                                                            'Submitted',
                                                                      );
                                                                      await listViewMaintenanceRecord
                                                                          .reference
                                                                          .update(
                                                                              maintenanceUpdateData);
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_Show-Snack-Bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Item rejected',
                                                                            style:
                                                                                TextStyle(
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
                                                                    caption:
                                                                        'Complete',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .campusRed,
                                                                    icon: Icons
                                                                        .logout,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_Backend-Call');

                                                                      final maintenanceUpdateData =
                                                                          createMaintenanceRecordData(
                                                                        status:
                                                                            'Completed',
                                                                        updateTime:
                                                                            getCurrentTimestamp,
                                                                      );
                                                                      await listViewMaintenanceRecord
                                                                          .reference
                                                                          .update(
                                                                              maintenanceUpdateData);
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_Backend-Call');
                                                                      await AirtableCall
                                                                          .call(
                                                                        user: listViewMaintenanceRecord
                                                                            .email,
                                                                        issue: listViewMaintenanceRecord
                                                                            .issue,
                                                                        room: listViewMaintenanceRecord
                                                                            .room,
                                                                        building:
                                                                            listViewMaintenanceRecord.building,
                                                                        status:
                                                                            'Completed',
                                                                        updated: dateTimeFormat(
                                                                            'MMMMEEEEd',
                                                                            listViewMaintenanceRecord.updateTime),
                                                                        name: listViewMaintenanceRecord
                                                                            .displayName,
                                                                        links:
                                                                            'campusafrica://campusafrica.com${GoRouter.of(context).location}',
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_Show-Snack-Bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Item successfully completed',
                                                                            style:
                                                                                TextStyle(
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
                                                                child: ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .account_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 35,
                                                                  ),
                                                                  title: Text(
                                                                    listViewMaintenanceRecord
                                                                        .issue,
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
                                                                    listViewMaintenanceRecord
                                                                        .room,
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
                                                                  tileColor: Color(
                                                                      0x00FFFFFF),
                                                                  dense: true,
                                                                ),
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
                                                            'Search results',
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
                                                              listViewMaintenanceRecordList =
                                                              snapshot.data;
                                                          if (listViewMaintenanceRecordList
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
                                                                listViewMaintenanceRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewMaintenanceRecord =
                                                                  listViewMaintenanceRecordList[
                                                                      listViewIndex];
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
                                                                        'Card_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Card_Navigate-To');
                                                                    context
                                                                        .pushNamed(
                                                                      'moreInfo',
                                                                      queryParams:
                                                                          {
                                                                        'jobStatus': serializeParam(
                                                                            listViewMaintenanceRecord,
                                                                            ParamType.Document),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'jobStatus':
                                                                            listViewMaintenanceRecord,
                                                                      },
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
                                                                                      listViewMaintenanceRecord.issue,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    listViewMaintenanceRecord.room,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: FlutterFlowTheme.of(context).campusRed,
                                                                                          fontWeight: FontWeight.w500,
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
}
