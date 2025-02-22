import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// SimpleX UI Extensions
extension SimpleXBox on num {
  SizedBox get hBox => SizedBox(height: toDouble());
  SizedBox get vBox => SizedBox(width: toDouble());
}

/// Toast messages
extension SimpleXToast on String {
  void showErrorToast() {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  void showWhiteToast() {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }

    void showBlackToast() {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}

/// 🛠️ SimpleX UI Extensions for Widget
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

  /// 🛠️ Conditional Widget Display
  Widget showIf(bool condition) => condition ? this : const SizedBox.shrink();
}

/// Extension on Text Widget
extension SimpleXTextStyle on Text {
  Text bold() =>
      Text(data!, style: style?.copyWith(fontWeight: FontWeight.bold));
  Text colored(Color color) =>
      Text(data!, style: style?.copyWith(color: color));
}
