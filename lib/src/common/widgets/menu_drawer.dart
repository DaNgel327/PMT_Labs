import 'package:flutter/material.dart';
import 'package:lab1/src/common/widgets/services/archive_service_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Add'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => ArchiveService.addPatient(),
            ),
          ),
          ListTile(
            title: Text('Edit'),
          ),
          ListTile(
            title: Text('Remove'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => ArchiveService.removePatient(),
            ),
          ),
          ListTile(
            title: Text('More...'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Info'),
                content: Text(
                  'The application was built on flutter version 2.0.3',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Back'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
