import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_changer/components/my_Box.dart';
import 'package:theme_changer/components/my_Button.dart';
import 'package:theme_changer/components/theme_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child:MyBox(
          color: Theme.of(context).colorScheme.primary,
          child:MyButton(
            color:  Theme.of(context).colorScheme.secondary,
            onTap: (){
              Provider.of<ThemeChanger>(context,listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
