import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watch_store/components/them.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/screens/home/prodoct_detail_screen.dart';
import 'package:watch_store/utils/shared_pref_mangment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceManger().init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
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
        // initialRoute: ScreenNames.root,
        // routes: routes,
        home: const ProductDetailScreen(),
      ),
    );
  }
}


// BlocBuilder<AuthCubit, AuthState>(
//           builder: (context, state) {
//             if (state is AuthLoggedInState) {
//               return const RootScreen();
//             } else if (state is AuthLogeOutState) {
//               return const SendSmsScreen();
//             } else {
//               return const SendSmsScreen();
//             }
//           },
//         ),