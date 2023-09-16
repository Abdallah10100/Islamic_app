import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
            onTap: () {
              provider.changeTheme((ThemeMode.dark));
            },

            /// dark
            child: provider.isDarkMode()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)),
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.light);
          },

          /// light
          child: provider.isDarkMode()
              ? getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
              : getSelectedItemWidget(AppLocalizations.of(context)!.light),
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
                ? MyTheme.primaryLight
                : MyTheme.primaryDark),
      ),
    );
  }
}
