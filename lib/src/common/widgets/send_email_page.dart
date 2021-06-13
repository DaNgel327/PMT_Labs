import 'package:flutter/material.dart';
import 'package:lab1/src/common/util/email_api_provider.dart';
import 'package:lab1/src/models/patient.dart';

class SenderPage extends StatefulWidget {
  List<Patient> cardsForSend;
  Future<bool> isMailed = Future.value(false);

  SenderPage(Patient patientCard) {
    this.cardsForSend = [patientCard];
  }

  SenderPage.sendCards(List<Patient> patients) {
    this.cardsForSend = patients;
  }

  @override
  _SenderPageState createState() => _SenderPageState();
}

class _SenderPageState extends State<SenderPage> {
  String email;
  EmailAPIProvider emailProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send by email'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                obscureText: false,
                onChanged: (String value) => email = value,
                validator: (value) =>
                    value.contains('@') ? null : 'Please enter valid email',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            StreamBuilder<bool>(
              stream: widget.isMailed.asStream(),
              builder: (context, snapshot) {
                return snapshot.data
                    ? Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        direction: Axis.horizontal,
                        spacing: 5,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 24,
                          ),
                          Text(
                            ' Mailed!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      )
                    : Container();
              },
            ),
            ElevatedButton(
              onPressed: () {
                emailProvider = EmailAPIProvider(
                  emailBody: _generateMailBody(),
                  emailSubject: 'Medical Cards',
                  emailRecipient: email,
                );
                widget.isMailed = emailProvider.sendEmail();

                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Send'),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _generateMailBody() {
    String mailBody = '';
    widget.cardsForSend
        .forEach((element) => mailBody += '${element.toString()}\n');
    return mailBody;
  }
}
