import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifBottomSheetWidget extends StatefulWidget {
  const NotifBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _NotifBottomSheetWidgetState createState() => _NotifBottomSheetWidgetState();
}

class _NotifBottomSheetWidgetState extends State<NotifBottomSheetWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        logFirebaseEvent('NOTIF_BOTTOM_SHEET_Column_e9i63axl_ON_TA');
        logFirebaseEvent('Column_bottom_sheet');
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'dz1ghic9' /* Schedule send */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18,
                          ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                  ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'uioanb3n' /* Discard */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18,
                          ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'NOTIF_BOTTOM_SHEET_ListTile_e1vd74gk_ON_');
                      logFirebaseEvent('ListTile_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          '02x8d75o' /* Cancel */,
                        ),
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18,
                            ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
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
