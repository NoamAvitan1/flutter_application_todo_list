import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/main_stuck.dart';

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
      title: 'noam demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 75, 191)),
        useMaterial3: true,
      ),
      home: const MainStuck(),
    );
  }
}










