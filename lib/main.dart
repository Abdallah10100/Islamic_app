import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_detailes_screen.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/quran/sura_detailes_screen.dart';
import 'package:islami_app/my_theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
        },
        theme: MyTheme.lightTheme);
  }
}
