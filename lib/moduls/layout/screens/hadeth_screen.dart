import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/moduls/hadeth/hadeth_details.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> hadethText = [];

  List<String> hadethTitle = [];

  @override
  Widget build(BuildContext context) {
    if (hadethTitle.isEmpty) {
      readFile();
    }
    var theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/hadeth_logo.png"),
          const Divider(),
          Text(
            "ahadeth".tr(),
            style: theme.textTheme.bodyLarge,
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: hadethTitle.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadethDetails.routeName,
                        arguments: hadethText[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hadethTitle[index],
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  readFile() async {
    String ahadeth = await rootBundle.loadString("assets/Hadeeth/ahadeth.txt");
    hadethText = ahadeth.split("#");
    for (int i = 0; i < hadethText.length; i++) {
      String title = hadethText[i].trim().split("\n")[0].trim();
      if (title.isNotEmpty) {
        hadethTitle.add(title);
      }
    }
    setState(() {});
  }
}
