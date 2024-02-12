import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
                /// change language to ENglish
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItem(AppLocalizations.of(context)!.english)
                  : getUnSelectedItem(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');

                /// change language to arabic
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItem(AppLocalizations.of(context)!.arabic))
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
