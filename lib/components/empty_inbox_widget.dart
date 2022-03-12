import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmptyInboxWidget extends StatefulWidget {
  const EmptyInboxWidget({Key key}) : super(key: key);

  @override
  _EmptyInboxWidgetState createState() => _EmptyInboxWidgetState();
}

class _EmptyInboxWidgetState extends State<EmptyInboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_vjnds77f.json',
                width: 150,
                height: 130,
                fit: BoxFit.cover,
                repeat: false,
                animate: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
