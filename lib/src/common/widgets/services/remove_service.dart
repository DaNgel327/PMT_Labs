import 'package:flutter/material.dart';
import 'package:lab1/src/models/archive.dart';

class RemoveService extends StatelessWidget {
  String _firstName;

  String _lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('remove patient'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enter patient\'s data',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: false,
                    onChanged: (String value) => _firstName = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: false,
                    onChanged: (String value) => _lastName = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Remove card'),
                    onPressed: () {
                      final isEntryFound = Archive.removePatient(
                        _firstName,
                        _lastName,
                      );

                      isEntryFound
                          ? showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Succeed'),
                                content:
                                    Text('Patient was removed from archive'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                            )
                          : showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Failed'),
                                content: Text('Patient was not found!'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
