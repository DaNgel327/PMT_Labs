import 'package:flutter/material.dart';

class DevConstants {
  static final String appTitle = 'Medical archive';
  static final Color appColor = Colors.cyan;

  static final int minId = 1000;
  static final int maxId = 9000;

  static final String username = 'c.ass.d2408@gmail.com';
  static final String password = 'Qawsed240899';

  static final double gridViewChildAspectRatio = 2 / 1.5;
  static final int gridViewCrossAxisCount = 1;

  static final double textFontSize = 36;

  static final double buttonWidth = 200.0;
  static final double buttonHeight = 50.0;
  static final Color buttonColor = Colors.cyan;
  static final Icon buttonIcon = Icon(Icons.autorenew);

  static String warningText = 'The archive of patients is currently empty. '
      'For initialize demo list, you have to open the archive.\n\n'
      'Press \"Open archive of patients\" button for demo archive initialization.';
}
