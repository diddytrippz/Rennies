import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../more_info/more_info_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPageWidget extends StatefulWidget {
  const ViewPageWidget({Key key}) : super(key: key);

  @override
  _ViewPageWidgetState createState() => _ViewPageWidgetState();
}

class _ViewPageWidgetState extends State<ViewPageWidget>
    with TickerProviderStateMixin {
  DateTimeRange calendarSelectedDay;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 800,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
                        color: Color(0xFFFFBA00),
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
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .campusGrey,
                                        ),
                                    hintText: 'Search here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
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
                                        fontFamily: 'Roboto',
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
                                onPressed: () {
                                  print('Button pressed ...');
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
                                        fontFamily: 'Roboto',
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
                              if ((currentUserDocument?.role) == 'Tenant')
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
                                                                          MoreInfoWidget(
                                                                        jobStatus:
                                                                            listViewMaintenanceRecord,
                                                                      ),
                                                                    ),
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
                                                                          await listViewMaintenanceRecord
                                                                              .reference
                                                                              .delete();
                                                                        }
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
                                                                          .campusGrey,
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
                                                                                'Roboto',
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
                                                                                'Roboto',
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right_sharp,
                                                                      color: Color(
                                                                          0xFF303030),
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
                                                                            MoreInfoWidget(
                                                                          jobStatus:
                                                                              listViewMaintenanceRecord,
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
                                                                          .campusGrey,
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
                                                                                'Roboto',
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
                                                                                'Roboto',
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
                                                                      'isDone',
                                                                      isEqualTo:
                                                                          true)
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
                                                                          MoreInfoWidget(
                                                                        jobStatus:
                                                                            listViewMaintenanceRecord,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .account_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .campusGrey,
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
                                                                              'Roboto',
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
                                                                              'Roboto',
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                  ),
                                                                  trailing:
                                                                      Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_sharp,
                                                                    color: Color(
                                                                        0xFF303030),
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
                              if ((currentUserDocument?.role) == 'Admin')
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
                                                                  isEqualTo: currentUserDocument
                                                                              ?.building !=
                                                                          ''
                                                                      ? currentUserDocument
                                                                          ?.building
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
                                                                          MoreInfoWidget(
                                                                        jobStatus:
                                                                            listViewMaintenanceRecord,
                                                                      ),
                                                                    ),
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
                                                                      icon: FFIcons
                                                                          .enter,
                                                                      onTap:
                                                                          () async {
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
                                                                          .campusGrey,
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
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16,
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
                                                                                'Roboto',
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right_sharp,
                                                                      color: Color(
                                                                          0xFF303030),
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
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                MaintenanceRecord>>(
                                                          stream:
                                                              queryMaintenanceRecord(
                                                            queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                .where('status',
                                                                    isEqualTo:
                                                                        'Pending')
                                                                .where(
                                                                    'building',
                                                                    isEqualTo:
                                                                        currentUserDocument
                                                                            ?.building)
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
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          4,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              MoreInfoWidget(
                                                                            jobStatus:
                                                                                listViewMaintenanceRecord,
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
                                                                          1,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 4,
                                                                              height: 80,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).campusRed,
                                                                                borderRadius: BorderRadius.circular(4),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).campusGrey,
                                                                                            fontSize: 12,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                      child: Text(
                                                                                        listViewMaintenanceRecord.issue,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 18,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if ((listViewMaintenanceRecord.notes) != '')
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                            child: AutoSizeText(
                                                                                              listViewMaintenanceRecord.notes.maybeHandleOverflow(
                                                                                                maxChars: 25,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 16,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    Text(
                                                                                      listViewMaintenanceRecord.room,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).campusRed,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                ToggleIcon(
                                                                                  onPressed: () async {
                                                                                    final maintenanceUpdateData = createMaintenanceRecordData(
                                                                                      isDone: !listViewMaintenanceRecord.isDone,
                                                                                    );
                                                                                    await listViewMaintenanceRecord.reference.update(maintenanceUpdateData);
                                                                                  },
                                                                                  value: listViewMaintenanceRecord.isDone,
                                                                                  onIcon: Icon(
                                                                                    Icons.check_box,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 25,
                                                                                  ),
                                                                                  offIcon: Icon(
                                                                                    Icons.check_box_outline_blank,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 25,
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                MaintenanceRecord>>(
                                                          stream:
                                                              queryMaintenanceRecord(
                                                            queryBuilder: (maintenanceRecord) => maintenanceRecord
                                                                .where(
                                                                    'building',
                                                                    isEqualTo:
                                                                        currentUserDocument
                                                                            ?.building)
                                                                .where('isDone',
                                                                    isEqualTo:
                                                                        true)
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
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          4,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              MoreInfoWidget(
                                                                            jobStatus:
                                                                                listViewMaintenanceRecord,
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
                                                                          2,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 4,
                                                                              height: 80,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF0AB200),
                                                                                borderRadius: BorderRadius.circular(4),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat('MMMMEEEEd', listViewMaintenanceRecord.createdTime),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).campusGrey,
                                                                                            fontSize: 12,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                      child: Text(
                                                                                        listViewMaintenanceRecord.issue,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 18,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      listViewMaintenanceRecord.room,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Roboto',
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
