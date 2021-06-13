import 'package:flutter/material.dart';
import 'package:lab1/src/common/widgets/send_email_page.dart';
import 'package:lab1/src/models/archive.dart';
import 'package:lab1/src/common/widgets/menu_drawer.dart';

class ArchivePage extends StatefulWidget {
  ArchivePage({Key key}) : super(key: key);

  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    if (Archive.getPatients == null) {
      Archive.initDemoArchive();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical archive'),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: ListView.builder(
            itemCount: Archive.getPatients.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, patientCounter) {
              return ListTile(
                onTap: () async => await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Medical card'),
                    content:
                        Text('${Archive.getPatients[patientCounter].toString()}'
                            '\n\n'
                            'Do you want to send this card?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SenderPage(
                              Archive.getPatients[patientCounter],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '${Archive.getPatients[patientCounter].lastName} '
                            '${Archive.getPatients[patientCounter].firstName}',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            Archive.getPatients[patientCounter].status
                                .toString()
                                .split('.')
                                .last,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.arrow_back_rounded),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  Icons.update,
                  size: 28,
                ),
                onPressed: () => setState(() {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
