import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//https://stackoverflow.com/questions/70919127/your-project-requires-a-newer-version-of-the-kotlin-gradle-plugin-android-stud
//https://stackoverflow.com/questions/52060516/flutter-how-to-change-android-minsdkversion-in-flutter-project
//https://stackoverflow.com/questions/57032406/flutter-desktop-embedding-how-to-build-exe-file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        home: const AuthOrAppPage(),
      ),
    );
  }
}
