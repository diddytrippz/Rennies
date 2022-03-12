import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_page/chat_page_widget.dart';
import '../components/review_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({
    Key key,
    this.jobStatus,
  }) : super(key: key);

  final MaintenanceRecord jobStatus;

  @override
  _MoreInfoWidgetState createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).campusRed,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 40, 15, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      widget.jobStatus.photoUrl,
                                                      'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    widget.jobStatus.photoUrl,
                                                    'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                  ),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: valueOrDefault<String>(
                                              widget.jobStatus.photoUrl,
                                              'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(6),
                                                topRight: Radius.circular(6),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  widget.jobStatus.photoUrl,
                                                  'https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 35, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 8,
                                                borderWidth: 1,
                                                buttonSize: 45,
                                                fillColor: Color(0xABEDEDED),
                                                icon: Icon(
                                                  Icons.arrow_back_sharp,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                elevation: 30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  ),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: DefaultTabController(
                                          length: 2,
                                          initialIndex: 0,
                                          child: Column(
                                            children: [
                                              TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                tabs: [
                                                  Tab(
                                                    text: 'Details',
                                                  ),
                                                  Tab(
                                                    text: 'Comments',
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  children: [
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00FFFFFF),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((widget
                                                                        .jobStatus
                                                                        .status) ==
                                                                    'Submitted')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            18,
                                                                            18,
                                                                            18,
                                                                            0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            UsersRecord>>(
                                                                      stream:
                                                                          queryUsersRecord(
                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                            'email',
                                                                            isEqualTo:
                                                                                widget.jobStatus.email),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 60,
                                                                              height: 60,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 60,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<UsersRecord>
                                                                            rowUsersRecordList =
                                                                            snapshot.data;
                                                                        // Return an empty Container when the document does not exist.
                                                                        if (snapshot
                                                                            .data
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final rowUsersRecord = rowUsersRecordList.isNotEmpty
                                                                            ? rowUsersRecordList.first
                                                                            : null;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Reported ${dateTimeFormat('relative', widget.jobStatus.createdTime)}',
                                                                              style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                            ),
                                                                            if ((currentUserDocument?.role) ==
                                                                                'Admin')
                                                                              AuthUserStreamWidget(
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30,
                                                                                  borderWidth: 1,
                                                                                  buttonSize: 45,
                                                                                  fillColor: FlutterFlowTheme.of(context).campusRed,
                                                                                  icon: Icon(
                                                                                    Icons.mail_outline,
                                                                                    color: Colors.white,
                                                                                    size: 25,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await Navigator.push(
                                                                                      context,
                                                                                      PageTransition(
                                                                                        type: PageTransitionType.bottomToTop,
                                                                                        duration: Duration(milliseconds: 300),
                                                                                        reverseDuration: Duration(milliseconds: 300),
                                                                                        child: ChatPageWidget(
                                                                                          chatUser: rowUsersRecord,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                if ((widget
                                                                        .jobStatus
                                                                        .status) ==
                                                                    'Completed')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            18,
                                                                            18,
                                                                            18,
                                                                            0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            UsersRecord>>(
                                                                      stream:
                                                                          queryUsersRecord(
                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                            'email',
                                                                            isEqualTo:
                                                                                widget.jobStatus.email),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 60,
                                                                              height: 60,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 60,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<UsersRecord>
                                                                            rowUsersRecordList =
                                                                            snapshot.data;
                                                                        // Return an empty Container when the document does not exist.
                                                                        if (snapshot
                                                                            .data
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final rowUsersRecord = rowUsersRecordList.isNotEmpty
                                                                            ? rowUsersRecordList.first
                                                                            : null;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Completed ${dateTimeFormat('relative', widget.jobStatus.createdTime)}',
                                                                              style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                            ),
                                                                            if ((currentUserDocument?.role) ==
                                                                                'Admin')
                                                                              AuthUserStreamWidget(
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30,
                                                                                  borderWidth: 1,
                                                                                  buttonSize: 45,
                                                                                  fillColor: FlutterFlowTheme.of(context).campusRed,
                                                                                  icon: Icon(
                                                                                    Icons.mail_outlined,
                                                                                    color: Colors.white,
                                                                                    size: 25,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await Navigator.push(
                                                                                      context,
                                                                                      PageTransition(
                                                                                        type: PageTransitionType.bottomToTop,
                                                                                        duration: Duration(milliseconds: 300),
                                                                                        reverseDuration: Duration(milliseconds: 300),
                                                                                        child: ChatPageWidget(
                                                                                          chatUser: rowUsersRecord,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          12,
                                                                          20,
                                                                          0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    widget
                                                                        .jobStatus
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
                                                                              20,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if ((widget
                                                                        .jobStatus
                                                                        .notes) !=
                                                                    '')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            8,
                                                                            16,
                                                                            2),
                                                                    child:
                                                                        AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .jobStatus
                                                                            .notes,
                                                                        'This section is currently empty. No additional notes/attachments were added in this request',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Color(0xFF595959),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (widget
                                                                        .jobStatus
                                                                        .isDone ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            18,
                                                                            10,
                                                                            18,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              70,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxHeight:
                                                                                32,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).campusGrey,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4,
                                                                                color: Color(0x32171717),
                                                                                offset: Offset(0, 2),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                  child: AutoSizeText(
                                                                                    widget.jobStatus.category,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Colors.white,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              if ((widget.jobStatus.isDone) == true) {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x5DFFFFFF),
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: ReviewWidget(
                                                                                        forReviews: widget.jobStatus,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 70,
                                                                              constraints: BoxConstraints(
                                                                                maxHeight: 32,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).campusRed,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4,
                                                                                    color: Color(0x32171717),
                                                                                    offset: Offset(0, 2),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(30),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                      child: AutoSizeText(
                                                                                        'Rate Job',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: Colors.white,
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (!(widget
                                                                        .jobStatus
                                                                        .isDone) ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            18,
                                                                            10,
                                                                            18,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              70,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxHeight:
                                                                                32,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).campusGrey,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4,
                                                                                color: Color(0x32171717),
                                                                                offset: Offset(0, 2),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                  child: AutoSizeText(
                                                                                    widget.jobStatus.category,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Colors.white,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              if ((widget.jobStatus.isDone) == true) {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x5DFFFFFF),
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: ReviewWidget(
                                                                                        forReviews: widget.jobStatus,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 70,
                                                                              constraints: BoxConstraints(
                                                                                maxHeight: 32,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).campusRed,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4,
                                                                                    color: Color(0x32171717),
                                                                                    offset: Offset(0, 2),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(30),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                      child: AutoSizeText(
                                                                                        'Rate Job',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: Colors.white,
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          10,
                                                                          16,
                                                                          0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          UsersRecord>>(
                                                                    stream:
                                                                        queryUsersRecord(
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                60,
                                                                            height:
                                                                                60,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 60,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<UsersRecord>
                                                                          nameRatingUsersRecordList =
                                                                          snapshot
                                                                              .data;
                                                                      // Return an empty Container when the document does not exist.
                                                                      if (snapshot
                                                                          .data
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final nameRatingUsersRecord = nameRatingUsersRecordList
                                                                              .isNotEmpty
                                                                          ? nameRatingUsersRecordList
                                                                              .first
                                                                          : null;
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                                                                                child: Container(
                                                                                  width: 45,
                                                                                  height: 45,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Icon(
                                                                                    FFIcons.user,
                                                                                    color: FlutterFlowTheme.of(context).campusGrey,
                                                                                    size: 30,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                child: Text(
                                                                                  widget.jobStatus.displayName,
                                                                                  style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              AutoSizeText(
                                                                                'Rating',
                                                                                style: FlutterFlowTheme.of(context).bodyText2,
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                    child: AutoSizeText(
                                                                                      valueOrDefault<String>(
                                                                                        widget.jobStatus.rating.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).title3.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 18,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 20,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      FFIcons
                                                                          .location2,
                                                                      color: Color(
                                                                          0xFF464749),
                                                                      size: 30,
                                                                    ),
                                                                    title: Text(
                                                                      widget
                                                                          .jobStatus
                                                                          .building,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
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
                                                                      'Room: ${widget.jobStatus.room}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    dense: true,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          18,
                                                                          2,
                                                                          16,
                                                                          0),
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      color: Color(
                                                                          0xFF464749),
                                                                      size: 25,
                                                                    ),
                                                                    title: Text(
                                                                      '${dateTimeFormat('MMMMEEEEd', widget.jobStatus.createdTime)} at ${dateTimeFormat('jm', widget.jobStatus.createdTime)}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
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
                                                                      dateTimeFormat(
                                                                          'relative',
                                                                          widget
                                                                              .jobStatus
                                                                              .createdTime),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    dense: true,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          2,
                                                                          16,
                                                                          0),
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      FFIcons
                                                                          .user,
                                                                      color: Color(
                                                                          0xFF464749),
                                                                      size: 25,
                                                                    ),
                                                                    title: Text(
                                                                      'Assigned to',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
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
                                                                      widget
                                                                          .jobStatus
                                                                          .assigned,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                    ),
                                                                    tileColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    dense: true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            80,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          150,
                                                                      height:
                                                                          150,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00EEEEEE),
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .scaleDown,
                                                                          image:
                                                                              Image.asset(
                                                                            'assets/images/undraw_no_data_re_kwbl.png',
                                                                          ).image,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            60,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'No results were found from your seaech.\nPlease try again.',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Color(0xFF9E9E9E),
                                                                          ),
                                                                    ),
                                                                  ],
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
                                            ],
                                          ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
