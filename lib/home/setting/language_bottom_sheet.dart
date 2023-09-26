import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                : getUnSelectedItemWidget(
                    AppLocalizations.of(context)!.english)),
        InkWell(
          onTap: () {
            provider.changeLanguage('ar');
          },
          child: provider.appLanguage == 'ar'
              ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
              : getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic),
        )
      ],
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: provider.isDarkMode()
                      ? MyTheme.primaryDark
                      : MyTheme.primaryLight)),
          Icon(Icons.check,
              color: provider.isDarkMode()
                  ? MyTheme.primaryDark
                  : MyTheme.primaryLight),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: provider.isDarkMode()
                  ? MyTheme.primaryDark
                  : MyTheme.primaryLight),
        ));
  }
}
