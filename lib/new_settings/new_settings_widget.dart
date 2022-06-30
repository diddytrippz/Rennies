import '../auth/auth_util.dart';
import '../components/dark_mode_widget.dart';
import '../components/language_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../new_profile/new_profile_widget.dart';
import '../rules_book/rules_book_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class NewSettingsWidget extends StatefulWidget {
  const NewSettingsWidget({Key? key}) : super(key: key);

  @override
  _NewSettingsWidgetState createState() => _NewSettingsWidgetState();
}

class _NewSettingsWidgetState extends State<NewSettingsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'newSettings'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'u72jdw6e' /* Settings */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(18, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 20),
                                    child: AuthUserStreamWidget(
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'NEW_SETTINGS_CircleImage_ett6gq2h_ON_TAP');
                                          logFirebaseEvent(
                                              'CircleImage_Expand-Image');
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: CachedNetworkImage(
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    currentUserPhoto,
                                                    'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                                ),
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: Container(
                                            width: 65,
                                            height: 65,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                currentUserPhoto,
                                                'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AuthUserStreamWidget(
                                          child: AutoSizeText(
                                            currentUserDisplayName
                                                .maybeHandleOverflow(
                                              maxChars: 14,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          currentUserEmail,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(70, 0, 50, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 0.2,
                              decoration: BoxDecoration(
                                color: Color(0x81464749),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 10, 10),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_7x0b896n_ON_TAP');
                                logFirebaseEvent('ListTile_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: NewProfileWidget(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.userAlt,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 20,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'l75068ci' /* Account */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_ty8u4mc1_ON_TAP');
                                logFirebaseEvent('ListTile_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child:
                                        NavBarPage(initialPage: 'MessagesPage'),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Icon(
                                  FFIcons.ksend1,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 24,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'nj9u6e42' /* Messages */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 0.2,
                              decoration: BoxDecoration(
                                color: Color(0x81464749),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 10, 10),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_qpqshfu5_ON_TAP');
                                logFirebaseEvent('ListTile_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: DarkModeWidget(),
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.color_lens,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 28,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    't9754pmw' /* Appearance */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_dcv0ybyv_ON_TAP');
                                logFirebaseEvent('ListTile_Show-Snack-Bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Currently unavailable',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Icon(
                                  FFIcons.kchecklist,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 24,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'k25fzrux' /* Checklist */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 0.2,
                              decoration: BoxDecoration(
                                color: Color(0x81464749),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_anbw2i5r_ON_TAP');
                                logFirebaseEvent('ListTile_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: RulesBookWidget(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.stickyNote,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 24,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'mv65usit' /* Residence fees */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 0.2,
                              decoration: BoxDecoration(
                                color: Color(0x81464749),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 10, 10),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_upo1bc6t_ON_TAP');
                                logFirebaseEvent('ListTile_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: NavBarPage(
                                        initialPage: 'notifications'),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.notifications_active,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 26,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'w3kgqtsc' /* Notifications */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 30),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_rdqryog8_ON_TAP');
                                logFirebaseEvent('ListTile_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: LanguageWidget(),
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.language,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 24,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'lfkifcv6' /* Language */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 0.2,
                              decoration: BoxDecoration(
                                color: Color(0x81464749),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_nodnox8i_ON_TAP');
                                logFirebaseEvent('ListTile_Launch-U-R-L');
                                await launchURL(
                                    'https://www.wits.ac.za/about-wits/');
                              },
                              child: ListTile(
                                leading: FaIcon(
                                  FontAwesomeIcons.externalLinkAlt,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 24,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    '2u2thzj6' /* About us */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 0.2,
                              decoration: BoxDecoration(
                                color: Color(0x81464749),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 10, 20),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_SETTINGS_ListTile_8xit2csm_ON_TAP');
                                logFirebaseEvent('ListTile_Auth');
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: LoginPageWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.logout,
                                  color:
                                      FlutterFlowTheme.of(context).campusGrey,
                                  size: 28,
                                ),
                                title: Text(
                                  FFLocalizations.of(context).getText(
                                    'ak9vojgx' /* Logout */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16,
                                ),
                                tileColor: Color(0x00F5F5F5),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
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
            ),
          ),
        ),
      ),
    );
  }
}
