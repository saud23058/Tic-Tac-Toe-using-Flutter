
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_changer/components/theme.dart';
import 'package:theme_changer/components/theme_provider.dart';
import 'package:theme_changer/screens/home_screen.dart';
void main() {
  runApp(
      ChangeNotifierProvider(create: (context)=>ThemeChanger(),
      child: const MyApp(),
      ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: Provider.of<ThemeChanger>(context).themeData,
    );
  }
}
