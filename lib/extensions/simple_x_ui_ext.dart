import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 🛠️ SimpleX Spacing Extensions
extension SimpleXBox on num {
  SizedBox get hBox => SizedBox(height: toDouble());
  SizedBox get vBox => SizedBox(width: toDouble());
}

/// 🍞 Toast Messages
extension SimpleXToast on String {
  /// Determines the text color based on system theme
  Color get _toastDynamicColor {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  void showToast({
    Color? backgroundColor,
    Color? textColor,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast toastLength = Toast.LENGTH_LONG,
  }) {
    Fluttertoast.showToast(
      msg: this,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor ?? _toastDynamicColor,
      textColor: textColor ??
          (backgroundColor != null
              ? (backgroundColor == Colors.white ? Colors.black : Colors.white)
              : (_toastDynamicColor == Colors.white
                  ? Colors.black
                  : Colors.white)),
    );
  }

  void showErrorToast() => showToast(backgroundColor: Colors.red);
  void showWhiteToast() =>
      showToast(backgroundColor: Colors.white, textColor: Colors.black);
  void showBlackToast() => showToast(backgroundColor: Colors.black);
  void showSuccessToast() => showToast(backgroundColor: Colors.green);
  void showWarningToast() => showToast(backgroundColor: Colors.orange);
  void showInfoToast() => showToast(backgroundColor: Colors.blue);
}

/// 🛠️ SimpleX Widget Extensions
extension SimpleXWidgetExtensions on Widget {
  /// Apply padding
  Widget pad({
    double all = 0,
    double horizontal = 0,
    double vertical = 0,
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left != 0 ? left : (horizontal != 0 ? horizontal : all),
        right: right != 0 ? right : (horizontal != 0 ? horizontal : all),
        top: top != 0 ? top : (vertical != 0 ? vertical : all),
        bottom: bottom != 0 ? bottom : (vertical != 0 ? vertical : all),
      ),
      child: this,
    );
  }

  /// Apply margin
  Widget margin({
    double all = 0,
    double horizontal = 0,
    double vertical = 0,
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left != 0 ? left : (horizontal != 0 ? horizontal : all),
        right: right != 0 ? right : (horizontal != 0 ? horizontal : all),
        top: top != 0 ? top : (vertical != 0 ? vertical : all),
        bottom: bottom != 0 ? bottom : (vertical != 0 ? vertical : all),
      ),
      child: this,
    );
  }

  /// Center the widget
  Widget centered() => Center(child: this);

  /// Wrap with Expanded
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Wrap with Flexible
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Wrap with InkWell for quick tap detection
  Widget onTap(VoidCallback onTap, {BorderRadius? borderRadius}) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: this,
    );
  }

  /// Wrap with GestureDetector
  Widget onPressed(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  /// Apply opacity
  Widget opacity(double value) => Opacity(opacity: value, child: this);

  /// Apply shadow
  Widget shadow(
      {double blur = 5.0, double spread = 1.0, Color color = Colors.black26}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blur,
            spreadRadius: spread,
          ),
        ],
      ),
      child: this,
    );
  }

  /// Rotate widget
  Widget rotate(double angle) => Transform.rotate(angle: angle, child: this);

  /// Scale widget
  Widget scale(double factor) => Transform.scale(scale: factor, child: this);

  /// Show/Hide conditionally
  Widget showIf(bool condition) => condition ? this : const SizedBox.shrink();
}

/// 📝 SimpleX Text Styling Extensions
extension SimpleXTextStyle on Text {
  Text bold() =>
      Text(data!, style: style?.copyWith(fontWeight: FontWeight.bold));
  Text italic() =>
      Text(data!, style: style?.copyWith(fontStyle: FontStyle.italic));
  Text underlined() =>
      Text(data!, style: style?.copyWith(decoration: TextDecoration.underline));
  Text colored(Color color) =>
      Text(data!, style: style?.copyWith(color: color));
  Text size(double fontSize) =>
      Text(data!, style: style?.copyWith(fontSize: fontSize));
}
