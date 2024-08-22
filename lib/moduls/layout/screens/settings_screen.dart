import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/thems/themes.dart';
import 'package:islami_app/moduls/layout/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            showLangSheet(context,provider);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.yellowLightColor, width: 2)),
            child: const Text("English"),
          ),
        ),
        InkWell(
          onTap: () {
            showThemeSheet(context,provider);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.yellowLightColor, width: 2)),
            child: const Text("Light"),
          ),
        ),
      ],
    );
  }

  showLangSheet(BuildContext context,SettingsProvider provider) {

    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      backgroundColor: theme.primaryColor,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.4,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeLang(context, "en");
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border:
                        Border.all(color: AppTheme.yellowLightColor, width: 2)),
                child: const Text("English"),
              ),
            ),
            InkWell(
              onTap: () {
                provider.changeLang(context, "ar");
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border:
                        Border.all(color: AppTheme.yellowLightColor, width: 2)),
                child: const Text("العربية"),
              ),
            ),
          ],
        );
      },
    );
  }

  showThemeSheet(BuildContext context,SettingsProvider provider) {
    var theme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      backgroundColor: theme.primaryColor,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.4,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: AppTheme.yellowLightColor, width: 2)),
                child: const Text("Dark"),
              ),
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);

              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border:
                        Border.all(color: AppTheme.yellowLightColor, width: 2)),
                child: const Text("Light"),
              ),
            ),
          ],
        );
      },
    );
  }
}
