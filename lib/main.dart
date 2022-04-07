import 'dart:async';
import 'package:flutter/material.dart';
import 'package:milyoner/test.dart';
import 'package:audioplayers/audioplayers.dart';

import 'constants.dart';

void main() {
  runApp(Milyoner());
}

class Milyoner extends StatelessWidget {
  const Milyoner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.teal,
              Colors.blue,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: YarismaSayfasi(),
            ),
          ),
        ),
      ),
    );
  }
}

class YarismaSayfasi extends StatefulWidget {
  const YarismaSayfasi({Key? key}) : super(key: key);

  @override
  State<YarismaSayfasi> createState() => _YarismaSayfasiState();
}

class _YarismaSayfasiState extends State<YarismaSayfasi> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  int _start = 30;
  late Timer _timer;

  void startTimer() {
    _start = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          /**/
          _timer.cancel();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text(
                  "SÜRE DOLDU!",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                content: Text(
                  "Lütfen belirlenen süre içerisinde seçiminizi yapınız.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                actions: <Widget>[
                  new ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    ),
                    child: new Text(
                      "Tekrar Dene",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        test_1.testiSifirla();
                        cevapKontrolu = [];
                        startTimer();
                        dogruYanitlar = 0;
                      });
                    },
                  ),
                ],
              );
            },
          );
        }
      });
    });
  }

  Test test_1 = Test();

  List<Widget> cevapKontrolu = [];
  int dogruYanitlar = 0;

  final oynatici = AudioCache();

  void butonlar(bool butonDegeri) {
    if (test_1.soruBitir() == true) {
      _timer.cancel();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "Tebrikler! Testi Bitirdiniz.",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            content: Text(
              "Puanınız: ${dogruYanitlar * 10}",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            actions: <Widget>[
              new ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan),
                ),
                child: new Text(
                  "Tekrar Dene",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testiSifirla();
                    cevapKontrolu = [];
                    startTimer();
                    dogruYanitlar = 0;
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(
        () {
          if (test_1.getSoruYaniti_1() == butonDegeri) {
            cevapKontrolu.add(kdogru);
            oynatici.play('dogru.mp3');
            dogruYanitlar = dogruYanitlar + 1;
          } else {
            cevapKontrolu.add(kyanlis);
            oynatici.play('yanlis.mp3');
          }
          test_1.soruArttir();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Center(
              child: Text(
                "$_start",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          children: cevapKontrolu,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[500]),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          butonlar(true);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[500]),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          butonlar(false);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.thumb_down,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
