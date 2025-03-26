import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/component/themes.dart';
import 'package:watch_store/screens/root_screen.dart';

void main() async {
  runApp(const MyApp());
  //SharePrefance
  WidgetsFlutterBinding.ensureInitialized();
  // init get it

  await getItInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // Farsi
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: RootScreen(),
    );
  }
}
