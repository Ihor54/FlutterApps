import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String sound) {
    final player = AudioCache();
    player.play("$sound.wav");
  }

  Expanded buildKey({Color keyColor, String sound}) {
    return Expanded(
      child: Card(
        child: FlatButton(
          color: keyColor,
          onPressed: () {
            playSound(sound);
          },
          child: Text(sound.toUpperCase()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildKey(keyColor: Colors.red, sound: "clap"),
                    buildKey(keyColor: Colors.orange, sound: "kick")
                  ],
                ),
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(keyColor: Colors.yellow, sound: "hat"),
                      buildKey(keyColor: Colors.green, sound: "drum"),
                    ]),
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(keyColor: Colors.teal, sound: "wind"),
                      buildKey(keyColor: Colors.blue, sound: "guitar"),
                    ]),
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildKey(keyColor: Colors.purple, sound: "la-synth"),
                      buildKey(keyColor: Colors.lightBlue, sound: "disco"),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
