import 'package:flutter/material.dart';
import 'package:lab1/src/common/constants/constants.dart';

class WarningArchiveAlert extends StatelessWidget {
  const WarningArchiveAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
            size: 48,
          ),
          const VerticalDivider(),
          Text('--- WARNING ---'),
        ],
      ),
      content: Text(DevConstants.warningText),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'I\'ll do it!',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
