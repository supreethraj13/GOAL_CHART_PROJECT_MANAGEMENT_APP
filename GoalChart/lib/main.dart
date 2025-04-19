import 'package:GoalChart/provider/Authprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GoalChart/screen/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (context)=> AuthPresenter()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        title: 'Goal Chart',
        home: const SplashPage(),
      ),
    );
  }
}
