import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen/settings/language_bottom_sheet.dart';
import 'package:islami/home_screen/settings/theme_bottom_sheet%20.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyTheme.primaryLightMode
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'?
                    AppLocalizations.of(context)!.english
                    :
                    AppLocalizations.of(context)!.arabic
                    
                    ,
                  style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Icons.arrow_drop_down,
                  size: 30,
                  )
                ],
              ),
            ),
          )
       , SizedBox(height: 20,),
         Text(AppLocalizations.of(context)!.theme,
          style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyTheme.primaryLightMode
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDark()?
                    AppLocalizations.of(context)!.dark
                    :
                    AppLocalizations.of(context)!.light
                    
                    ,
                  style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Icons.arrow_drop_down,
                  size: 30,
                  )
                ],
              ),
            ),
          )
       
        ],
      ),
    );
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
    context: context, 
    builder: (context) {
      return LanguageBottomSheet();
    },);
  }
  
  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
     builder: (context) {
       return ThemeBottomSheet();
     },
     );
  }
}