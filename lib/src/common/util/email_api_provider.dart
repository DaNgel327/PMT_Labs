import 'package:flutter/foundation.dart';
import 'package:lab1/src/common/constants/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailAPIProvider {
  EmailAPIProvider({
    @required this.emailBody,
    @required this.emailSubject,
    @required this.emailRecipient,
  }) : assert(emailBody != null &&
            emailSubject != null &&
            emailRecipient != null);

  final String emailBody;
  final String emailSubject;
  final String emailRecipient;

  // ignore: deprecated_member_use
  final smtpServer = gmail(DevConstants.username, DevConstants.password);

  Future<bool> sendEmail() async {
    final message = Message()
      ..from = Address(DevConstants.username)
      ..recipients.add(emailRecipient)
      ..subject = 'Medical archive :: ${DateTime.now()}'
      ..text = emailBody;

    Future<bool> isSent = Future.value(false);

    try {
      await send(message, smtpServer);
      isSent = Future.value(true);
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
    }
    return isSent;
  }
}
