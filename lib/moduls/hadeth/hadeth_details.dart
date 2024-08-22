import 'package:flutter/material.dart';
import 'package:islami_app/core/widgets/custom_background.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadethDetails";
  HadethDetails({super.key});
  String title = "";
  String body = "";
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    splitData(data);
    return CustomBackground(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.width * 0.1,
            left: size.width * 0.1,
            bottom: size.height * 0.2,
          ),
          child: Column(
            children: [
              Text(title),
              const Divider(),
              Text(
                body,
                textDirection: TextDirection.rtl,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  splitData(String data) {
    title = data.trim().split("\n")[0].trim();
    body = data.trim().split("\n")[1].trim();
  }
}
