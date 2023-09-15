import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/hadeth_icon.png")),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                    label: 'Sepha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio_icon.png")),
                    label: 'Radio'),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
