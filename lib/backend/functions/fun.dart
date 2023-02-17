import 'package:djhackathon/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Fun {
  final FirebaseDatabase database;

  Fun(this.database);

  static Future notify(String title, String body) async {
    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  static Future openGmail(
      String subject, String body, List<String> recipients) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: recipients,
    );
    await FlutterEmailSender.send(email);
  }

  Future getData(String key) async {
    dynamic user;
    await database.ref().child(key).get().then(
      (snapshot) {
        if (snapshot.exists) {
          user = snapshot.value;
          return user;
        }
      },
    ).catchError((error) {
      throw error;
    });
    return user;
  }

  Future<bool> setData(String key, Object value) async {
    bool status = await database
        .ref(key)
        .set(value)
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return status;
  }

  Future<bool> updateData(String key, Map<String, Object> value) async {
    bool status = await database
        .ref(key)
        .update(value)
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return status;
  }

  Future<bool> pushData(String key, dynamic value) async {
    bool status = await database
        .ref(key)
        .push()
        .set(value)
        .then((value) => true)
        .onError((error, stackTrace) => false);
    return status;
  }

  // static Future sendMail(String email, String subject, String body,
  //     List<String> recipients) async {
  //   const token =
  //       "ya29.a0AVvZVsrQRnu0o-tEsY42wVjCnXXKBw7bjHbyk0kAzNYbqiXJcH-DoGCoBpZ3qGxGqxffTNUFeqW4FCUVUOF-It6KyUCCbiL_zLQ8dhCoMTKt9ynJ7mLIHuv7WTMhLfsf9PgBPDbBbeqaMWeBC-du59Dcrzu-aCgYKAYcSARASFQGbdwaIwl5Ha3JbENVTMWx9r2rgew0163";
  //   final Message message = Message()
  //     ..from = Address(email, "DJ Hackathon")
  //     ..subject = subject
  //     ..text = body
  //     ..recipients = recipients;

  //   final smtp = gmailSaslXoauth2("akshay0706vhatkar@gmail.com", token);

  //   await send(message, smtp);
  // }
}
