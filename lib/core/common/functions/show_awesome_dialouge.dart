import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showAwesomeDialouge({
  required BuildContext context,
  required String header,
  required String description,
  @required DialogType? dialogType,
}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType ?? DialogType.info,
    animType: AnimType.scale,
    title: header,
    desc: description,
    btnOkOnPress: () {},
  ).show();
}
