import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/component/themes.dart';
import 'package:watch_store/cubit/auth_cubit.dart';
import 'package:watch_store/register/cubit/register_cubit.dart';
import 'package:watch_store/screens/home/bloc/home_bloc.dart';
import 'package:watch_store/screens/root_screen.dart';
import 'package:watch_store/utils/share_prefance_manger.dart';

void main() async {
  //SharePrefance
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  // init get it

  await getItInit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
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


// BlocBuilder<AuthCubit, AuthState>(
//         builder: (context, state) {
//           if (state is LoggedInState) {
//             return RootScreen();
//           } else if (state is LoggedOutState) {
//             return SendOtpScreen();
//           } else {
//             return SendOtpScreen();
//           }
//         },
//       ),