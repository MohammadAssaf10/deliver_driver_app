import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../di/di.dart';
import '../theming/colors_manager.dart';
import '../widget/loader.dart';
import 'app_enums.dart';
import 'app_extensions.dart';

void dPrint(String? message, {StringColor? stringColor}) {
  if (kDebugMode && message != null) {
    debugPrint(message.withColor(stringColor));
  }
}

void showToastMessage(String? toastMessage, {bool isError = false}) {
  if (toastMessage.nullOrEmpty()) return;
  Fluttertoast.showToast(
    gravity: ToastGravity.BOTTOM,
    msg: toastMessage!,
    backgroundColor: isError ? ColorsManager.error : ColorsManager.darkWhite,
    fontSize: 16,
    textColor: isError ? ColorsManager.darkWhite : ColorsManager.darkGrey,
  );
}

void showLoadingDialog(
  BuildContext context, {
  Color? backgroundColor,
  Color? loaderColor,
}) {
  if (getIt<GlobalKey<State>>().currentContext == null) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: backgroundColor,
      builder: (_) => Dialog(
        key: getIt<GlobalKey<State>>(),
        backgroundColor: backgroundColor ?? Colors.transparent,
        child: Loader(size: 50, color: loaderColor ?? ColorsManager.darkGrey),
      ),
    );
  }
}

void closeLoadingDialogIfVisible() {
  if (getIt<GlobalKey<State>>().currentContext != null) {
    Navigator.of(
      getIt<GlobalKey<State>>().currentContext!,
      rootNavigator: true,
    ).pop();
  }
}
