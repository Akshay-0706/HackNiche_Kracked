import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';
import 'global.dart';
import 'routes.dart';
import 'theme.dart';

const NotificationDetails notificationDetails =
    NotificationDetails(android: details);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification!.title,
    message.notification!.body,
    notificationDetails,
  );

  // print("Handling a background message: ${message.messageId}");
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    // print('Got a message whilst in the foreground!');
    // print('Message data: ${message.data}');

    if (message.notification != null) {
      // print('Message also contained a notification: ${message.notification}');
      // print(message.notification!.title);
      // print(message.notification!.body);

      try {
        await flutterLocalNotificationsPlugin.initialize(
          const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          ),
        );
      } on Exception catch (e) {}

      try {
        await flutterLocalNotificationsPlugin.show(
          message.notification!.hashCode,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
        );
      } catch (e) {}
    }
  });

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();

  @override
  void initState() {
    // themeChanger.isDarkMode = themeChanger.currentTheme() == ThemeMode.system
    //     ? WidgetsBinding.instance.window.platformBrightness == Brightness.dark
    //     : themeChanger.currentTheme() == ThemeMode.dark;

    // final window = WidgetsBinding.instance.window;

    // if (box.read("theme") == "Light") {
    //   themeChanger.changeThemeMode("Light");
    // }

    // if (box.read("theme") == "Dark") {
    //   themeChanger.changeThemeMode("Dark");
    // }

    // window.onPlatformBrightnessChanged = () {
    //   setState(() {
    //     themeChanger.isDarkMode =
    //         themeChanger.currentTheme() == ThemeMode.system
    //             ? WidgetsBinding.instance.window.platformBrightness ==
    //                 Brightness.dark
    //             : themeChanger.currentTheme() == ThemeMode.dark;
    //   });

    //   if (themeChanger.theme == "Auto") {
    //     setState(() {
    //       themeChanger.changeThemeMode("Auto");
    //     });
    //   }
    // };

    // themeChanger.addListener(() {
    //   setState(() {});
    // });

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DJ Hackathon',
      theme: AppTheme.lightTheme(),
      // darkTheme: AppTheme.darkTheme(),
      routes: routes,
    );
  }
}

const AndroidNotificationDetails details = AndroidNotificationDetails(
  'high_importance_channel2',
  'high_importance_channel2',
  channelDescription: 'This channel is used for important notifications.',
  importance: Importance.max,
  priority: Priority.high,
  ticker: 'ticker',
  icon: "@mipmap/ic_launcher",
);

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  playSound: true,
  importance: Importance.max,
);
