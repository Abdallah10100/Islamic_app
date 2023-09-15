import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';
import 'package:islami_app/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
              "${args.name}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .07,
                      horizontal: MediaQuery.of(context).size.width * .06),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: MyTheme.whiteColor),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Theme.of(context).primaryColor,
                        thickness: 3,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                          content: verses[index], index: index);
                    },
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

/// data class
class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
