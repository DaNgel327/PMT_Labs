import 'package:flutter/material.dart';
import 'package:lab1/src/common/constants/disease_status.dart';
import 'package:lab1/src/models/archive.dart';
import 'package:lab1/src/models/patient.dart';

class AddService extends StatefulWidget {
  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String _firstName;

  String _lastName;

  int _age;

  DiseaseStatus _status = DiseaseStatus.SICK;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add patient'),
      ),
      body: Center(
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
              child: TextField(
                obscureText: false,
                onChanged: (String value) => _age = int.parse(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Status:',
                    style: TextStyle(fontSize: 18),
                  ),
                  RadioListTile(
                    value: DiseaseStatus.SICK,
                    title: Text(
                      DiseaseStatus.SICK.toString().split('.').last,
                    ),
                    groupValue: _status,
                    onChanged: (DiseaseStatus value) {
                      setState(() => _status = value);
                    },
                  ),
                  RadioListTile(
                    value: DiseaseStatus.FOR_RELEASE,
                    title: Text(
                      DiseaseStatus.FOR_RELEASE.toString().split('.').last,
                    ),
                    groupValue: _status,
                    onChanged: (DiseaseStatus value) {
                      setState(() => _status = value);
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Create card',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              onPressed: () {
                Archive.addPatient(
                  Patient(
                    firstName: _firstName,
                    lastName: _lastName,
                    age: _age,
                    status: _status,
                  ),
                );

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Succeed'),
                    content: Text('Patient added to archive'),
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
          ],
        ),
      ),
    );
  }
}
