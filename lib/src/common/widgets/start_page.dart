import 'package:flutter/material.dart';
import 'package:lab1/src/common/constants/constants.dart';
import 'package:lab1/src/common/util/warning%20_archive_dialog.dart';
import 'package:lab1/src/common/widgets/archive_page.dart';
import 'package:lab1/src/common/widgets/send_email_page.dart';
import 'package:lab1/src/models/archive.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DevConstants.appTitle),
      ),
      body: Center(
        child: Wrap(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArchivePage()),
              ),
              child: Text('Open archive of patients'),
            ),
            const VerticalDivider(),
            ElevatedButton(
              child: Text('Send archive to e-mail'),
              onPressed: () => Archive.getPatients != null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SenderPage.sendCards(
                          Archive.getPatients,
                        ),
                      ),
                    )
                  : showDialog(
                      barrierColor: Colors.red,
                      context: context,
                      builder: (_) => WarningArchiveAlert(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
