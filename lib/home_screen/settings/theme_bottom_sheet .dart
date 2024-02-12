import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * .08,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: new BoxDecoration(
        color: MyTheme.primaryLightMode,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                /// change language to dark
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelectedItem(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItem(AppLocalizations.of(context)!.dark)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);

                /// change language to light
              },
              child: provider.isDark()
                  ? getUnSelectedItem(AppLocalizations.of(context)!.light)
                  : getSelectedItem(AppLocalizations.of(context)!.light))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Icon(
        Icons.check,
        size: 30,
      )
    ]);
  }

  Widget getUnSelectedItem(String text) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}
