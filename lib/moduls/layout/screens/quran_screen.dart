import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/moduls/layout/widgets/surah_name_widget.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/qur2an_screen_logo.png"),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text("surah_name".tr(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 25))),
            const SizedBox(
              height: 35,
              child: VerticalDivider(),
            ),
            Expanded(
                child: Text("verses_number".tr(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 25))),
          ],
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SurahNameWidget(index: index);
            },
            itemCount: 114,
          ),
        )
      ],
    );
  }
}
