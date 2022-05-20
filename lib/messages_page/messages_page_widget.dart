import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class MessagesPageWidget extends StatefulWidget {
  const MessagesPageWidget({Key key}) : super(key: key);

  @override
  _MessagesPageWidgetState createState() => _MessagesPageWidgetState();
}

class _MessagesPageWidgetState extends State<MessagesPageWidget> {
  List<ChatsRecord> simpleSearchResults = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MessagesPage'});
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('Icon_ON_TAP');
            logFirebaseEvent('Icon_Simple-Search');
            await queryChatsRecordOnce()
                .then(
                  (records) => simpleSearchResults = TextSearch(
                    records
                        .map(
                          (record) =>
                              TextSearchItem(record, [record.lastMessage]),
                        )
                        .toList(),
                  )
                      .search(textController.text)
                      .map((r) => r.object)
                      .take(5)
                      .toList(),
                )
                .onError((_, __) => simpleSearchResults = [])
                .whenComplete(() => setState(() {}));
          },
          child: Icon(
            FFIcons.ksearch,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
        ),
        title: Stack(
          children: [
            TextFormField(
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Search',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              keyboardType: TextInputType.name,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 18, 0),
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('Icon_ON_TAP');
                logFirebaseEvent('Icon_Clear-Text-Fields');
                setState(() {
                  textController?.clear();
                });
              },
              child: Icon(
                Icons.clear,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FaIcon(
          FontAwesomeIcons.facebookMessenger,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where('users', arrayContains: currentUserReference)
                  .orderBy('last_message_time', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 60,
                    ),
                  ),
                );
              }
              List<ChatsRecord> listViewChatsRecordList = snapshot.data;
              if (listViewChatsRecordList.isEmpty) {
                return Center(
                  child: EmptyListWidget(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                    child: StreamBuilder<FFChatInfo>(
                      stream: FFChatManager.instance
                          .getChatInfo(chatRecord: listViewChatsRecord),
                      builder: (context, snapshot) {
                        final chatInfo =
                            snapshot.data ?? FFChatInfo(listViewChatsRecord);
                        return FFChatPreview(
                          onTap: () => context.pushNamed(
                            'ChatPage',
                            queryParams: {
                              'chatUser': serializeParam(
                                  chatInfo.otherUsers.length == 1
                                      ? chatInfo.otherUsersList.first
                                      : null,
                                  ParamType.Document),
                              'chatRef': serializeParam(
                                  chatInfo.chatRecord.reference,
                                  ParamType.DocumentReference),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chatUser': chatInfo.otherUsers.length == 1
                                  ? chatInfo.otherUsersList.first
                                  : null,
                            },
                          ),
                          lastChatText: chatInfo.chatPreviewMessage(),
                          lastChatTime: listViewChatsRecord.lastMessageTime,
                          seen: listViewChatsRecord.lastMessageSeenBy
                              .contains(currentUserReference),
                          title: chatInfo.chatPreviewTitle(),
                          userProfilePic: chatInfo.chatPreviewPic(),
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          unreadColor: Color(0xFF0078FF),
                          titleTextStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          dateTextStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                          previewTextStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: FlutterFlowTheme.of(context).campusGrey,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                          borderRadius: BorderRadius.circular(0),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
