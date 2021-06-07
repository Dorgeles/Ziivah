import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog showprogressDialog(
    {BuildContext context, double size, Color color}) {
  final progressDialog =
      ProgressDialog(context, type: ProgressDialogType.Normal);
  progressDialog.style(
      message: "    Chargement",
      child: SizedBox(
        height: (size ?? 18),
        width: (size ?? 18),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
        ),
      ));
  return progressDialog;
}
