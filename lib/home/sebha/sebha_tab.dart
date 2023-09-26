import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int textIndex = 0;
  double angle = 0.01;
  List<String> texts = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
  ];

  void onSebhaPressed() {
    if (counter == 33) {
      if (textIndex == 3) {
        textIndex = 0;
      } else {
        textIndex++;
      }
      counter = 0;
    } else {
      counter++;
      angle++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  provider.isDarkMode()
                      ? Image.asset("assets/images/sebha_head_dark.png")
                      : Image.asset("assets/images/sebha_head.png"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: angle,
                      child: GestureDetector(
                        onTap: onSebhaPressed,
                        child: provider.isDarkMode()
                            ? Image.asset("assets/images/sebha_body_dark.png")
                            : Image.asset("assets/images/sebha_body.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            AppLocalizations.of(context)!.praises,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$counter",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                texts[textIndex],
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
