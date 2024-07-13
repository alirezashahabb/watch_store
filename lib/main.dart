import 'package:clock_shop/components/them.dart';
import 'package:clock_shop/route/name.dart';
import 'package:clock_shop/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClockShop',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      theme: lightTheme(),
      initialRoute: ScreenNames.root,
      // routes: routes,
      home: const ProductListScreen(),
    );
  }
}
