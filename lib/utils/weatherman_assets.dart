import 'package:flutter/material.dart';

class WeathermanAssets {
  //svgs
  static String _svgBasePath = "assets/svg/";
  static String notificationIcon = "${_svgBasePath}notification.svg";
  static String locationIcon = "${_svgBasePath}location.svg";
  static String cloudIcon = "${_svgBasePath}cloud.svg";
  static String dummySunIcon = "${_svgBasePath}dummysun.svg";

  //text
  static String _dMsans = "DMSans";

  //

  //textsyle
  static TextStyle customeTextStyle(
      {double size, FontWeight fontWeight, Color color, FontStyle fontStyle}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: size ?? 12,
        fontFamily: _dMsans,
        color: color ?? Color(0xff191919));
  }
}
