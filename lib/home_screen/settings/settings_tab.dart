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
    var provider = Provider.of<AppConfigProvider>(context);

   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Text(AppLocalizations.of(context)!.language,
         style: Theme.of(context).textTheme.titleMedium,
         ),
         DropdownButtonFormField(
         value: provider.appLanguage,
         items: [
           DropdownMenuItem(
             value: 'ar',
             child: Text(AppLocalizations.of(context)!.arabic),
           ),
           DropdownMenuItem(
             value: 'en',
             child: Text(AppLocalizations.of(context)!.english),
           ),
         ],
         onChanged: (value) {
           provider.changeLanguage(value as String);
           setState(() {});
         },
         isExpanded: true,
         decoration:  InputDecoration(
           focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: MyTheme.primaryLightMode),
           ),
           enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(color: MyTheme.primaryLightMode),
           ),
           border: OutlineInputBorder(
               borderSide: BorderSide(
                   style: BorderStyle.solid, color: MyTheme.primaryLightMode)),
         ),
         padding: EdgeInsets.only(
             top: MediaQuery.of(context).size.height * .05,
             bottom:MediaQuery.of(context).size.height * .05 
             ),
         dropdownColor: MyTheme.primaryLightMode,
         style: Theme.of(context).textTheme.titleSmall,
         icon:  Icon(
           Icons.arrow_drop_down,
           size: 35,
           color: MyTheme.primaryLightMode,
         ),
       ),
       Text(AppLocalizations.of(context)!.theme,
         style: Theme.of(context).textTheme.titleMedium,
         ),
         DropdownButtonFormField(
         value: provider.appTheme,
         items: [
           DropdownMenuItem(
             value: ThemeMode.light,
             child: Text(AppLocalizations.of(context)!.light),
           ),
           DropdownMenuItem(
             value: ThemeMode.dark,
             child: Text(AppLocalizations.of(context)!.dark),
           ),
         ],
         onChanged: (value) {
           provider.changeTheme(value as ThemeMode);
           setState(() {});
         },
         isExpanded: true,
         decoration:  InputDecoration(
           focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: MyTheme.primaryLightMode),
           ),
           enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(color: MyTheme.primaryLightMode),
           ),
           border: OutlineInputBorder(
               borderSide: BorderSide(
                   style: BorderStyle.solid, color: MyTheme.primaryLightMode)),
         ),
        padding: EdgeInsets.only(
             top: MediaQuery.of(context).size.height * .05,
             bottom:MediaQuery.of(context).size.height * .05 
             ),
         dropdownColor: MyTheme.primaryLightMode,
         style: Theme.of(context).textTheme.titleSmall,
         icon:  Icon(
           Icons.arrow_drop_down,
           size: 35,
           color: MyTheme.primaryLightMode,
         ),
       )
     
       ],
     ),
   );
  }
 
  }