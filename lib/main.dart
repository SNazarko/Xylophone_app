import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  MyHomepage({Key? key}) : super(key: key);

  void player(int nota) {
    final player = AssetsAudioPlayer();
    player.open(
      Audio("assets/note$nota.wav"),
    );
  }

  Align button(
      {required int numberNote, required double width, required Color color}) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          player(numberNote);
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: color),
              width: width,
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                button(numberNote: 1, width: 200, color: Colors.purple),
                button(numberNote: 2, width: 225, color: Colors.blue),
                button(numberNote: 3, width: 250, color: Colors.blueAccent),
                button(numberNote: 4, width: 275, color: Colors.green),
                button(numberNote: 5, width: 300, color: Colors.yellow),
                button(numberNote: 6, width: 325, color: Colors.orange),
                button(numberNote: 7, width: 350, color: Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
