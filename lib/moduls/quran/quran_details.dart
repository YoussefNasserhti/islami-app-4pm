import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/widgets/custom_background.dart';
import 'package:islami_app/moduls/layout/widgets/surah_name_widget.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "QuranDetails";
  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String surah = "";
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    SurahData data = ModalRoute.of(context)!.settings.arguments as SurahData;
    var theme = Theme.of(context);
    if (verses.isEmpty) {
      getSurahData(data.index);
    }
    return CustomBackground(
        child: Scaffold(
      appBar: AppBar(
        title: Text("islami".tr()),
      ),
      body: verses.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                  bottom: 20, left: 25, right: 25, top: 80),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5, spreadRadius: 5, color: Colors.black12)
                  ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.SurahName,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(Icons.play_circle_fill_rounded)
                    ],
                  ),
                  const Divider(
                    endIndent: 50,
                    indent: 50,
                    thickness: 2,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        String verseNumber =
                            replaceArabicNumber(" ${index + 1} ");
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                  text: replaceArabicNumber(
                                      verses[index].trimLeft().trimRight()),
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      fontFamily:
                                          GoogleFonts.amiriQuran().fontFamily),
                                ),
                                TextSpan(
                                    text: verseNumber,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        fontFamily: "Aya", fontSize: 35)),
                              ],
                            )),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    ));
  }

  getSurahData(int index) async {
    surah = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    surah = surah.trim();
    verses = surah.split("\n");
    setState(() {});
  }

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }
}
