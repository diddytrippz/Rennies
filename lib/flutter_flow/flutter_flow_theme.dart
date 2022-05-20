// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color campusRed;
  Color mellow;
  Color campusMellow;
  Color zellow;
  Color campusGrey;

  TextStyle get title1 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF757575),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF616161),
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF303030),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Open Sans',
        color: Color(0xFF424242),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF604AF6);
  Color secondaryColor = const Color(0xFFEE8B60);
  Color tertiaryColor = const Color(0xFFFFFFFF);
  Color alternate = const Color(0xFFEEEEEE);
  Color primaryBackground = const Color(0xFFFFFFFF);
  Color secondaryBackground = const Color(0xFFF2F2F2);
  Color primaryText = const Color(0xFF000000);
  Color secondaryText = const Color(0x00000000);

  Color campusRed = Color(0xFF604AF6);
  Color mellow = Color(0xFFFFBA00);
  Color campusMellow = Color(0xFFFEF058);
  Color zellow = Color(0xFFF0E020);
  Color campusGrey = Color(0xE1464749);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
