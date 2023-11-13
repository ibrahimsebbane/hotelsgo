import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotelsgo/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotels Go',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.green[800], secondary: Colors.blue[800]),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
            titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            bodySmall: TextStyle(fontSize: 10, color: Colors.black),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
            bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          )),
      home: const HomeScreen(title: 'HotelsGo'),
    );
  }
}
