import 'package:flutter/cupertino.dart';

Future<String?> showInputDialog(
  BuildContext context, {
  String? title,
}) async {
  String value = '';
  final result = await showCupertinoDialog<String>(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: CupertinoTextField(
        onChanged: (text) {
          value = text;
        },
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, value);
          },
          child: const Text("SAVES"),
          isDefaultAction: true,
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("CANCEL"),
          isDestructiveAction: true,
        ),
      ],
    ),
  );
}
