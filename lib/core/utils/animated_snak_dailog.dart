import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

dynamic showAnimatedSnakDailog(
  BuildContext context, {
  String? massage,
  AnimatedSnackBarType? type,
}) {
  AnimatedSnackBar.material(
    massage ?? "",
    type: type ?? AnimatedSnackBarType.success,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    desktopSnackBarPosition: DesktopSnackBarPosition.bottomRight,
  ).show(context);
}
