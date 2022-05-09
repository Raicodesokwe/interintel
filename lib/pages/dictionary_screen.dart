import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DictionaryScreen extends StatefulWidget {
  DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  bool isSorted = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map dictionary = {
      34: 'thirty-four',
      90: 'ninety',
      91: 'ninety-one',
      21: 'twenty-one',
      61: 'sixty-one',
      9: 'nine',
      2: 'two',
      6: 'six',
      3: 'three',
      8: 'eight',
      80: 'eighty',
      81: 'eighty-one',
      // 'Ninety-Nine': '99',
      // 'nine-hundred': '900'
    };
    Map secondDictionary = {'Ninety-Nine': '99', 'nine-hundred': '900'};
    var sortedKeys = dictionary.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    var sortedSecondKeys = secondDictionary.entries.toList()
      ..sort((a, b) => a.toString().compareTo(b.toString()));
    // sortedKeys.forEach((v)=>Text(v.value));
    // final allDictionaries = dictionaries.map((e) {
    //   final key = e.thekey;
    //   final value = e.thevalue;
    //   return Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 5),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [

    //         Text(
    //           value,
    //           style: GoogleFonts.prompt(
    //               color: Colors.white, fontWeight: FontWeight.w600),
    //         ),
    //       ],
    //     ),
    //   );
    // }).toList();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSorted = !isSorted;
                });
              },
              child: Container(
                  width: size.width * 0.5,
                  height: 50,
                  child: Center(
                      child: Text(
                    'Sort',
                    style: GoogleFonts.prompt(
                        color: !isSorted ? Colors.black87 : Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                  decoration: BoxDecoration(
                      color: !isSorted
                          ? Colors.transparent
                          : const Color(0xFF5113AA),
                      border: Border.all(
                          width: 4,
                          color: !isSorted
                              ? const Color(0xFF5113AA)
                              : Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF5113AA),
                  border: Border.all(
                      width: 4, color: Colors.black.withOpacity(0.2))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: !isSorted
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...dictionary.entries.map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.key.toString(),
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                    Text(e.value,
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              )),
                          ...secondDictionary.entries.map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.key,
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                    Text(e.value,
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ))
                          // ...sortedKeys.map((e) => Text(
                          //       e.value,
                          //       style: GoogleFonts.prompt(color: Colors.red),
                          //     ))
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...sortedKeys.map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.key.toString(),
                                      style: GoogleFonts.prompt(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      e.value,
                                      style: GoogleFonts.prompt(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )),
                          ...sortedSecondKeys.map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.key,
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                    Text(e.value,
                                        style: GoogleFonts.prompt(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ))
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
