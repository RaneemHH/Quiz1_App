import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Mood(),
        ),
      ),
    ),
  );
}

class Mood extends StatefulWidget {
  const Mood({super.key});

  @override
  State<Mood> createState() {
    return _Mood();
  }
}

class _Mood extends State<Mood> {
  final List<String> moods = ['Happy', 'Tired', 'Angrey'];
  String userMood = '❓';
  int countHappy = 0;
  int countTired = 0;
  int countAngrey = 0;
  void choose(String choice) {
    setState(() {
      choice == 'Happy'
          ? countHappy += 1
          : choice == 'Tired'
          ? countTired += 1
          : choice == "Angrey"
          ? countAngrey += 1
          : {countTired = 0, countHappy = 0, countAngrey = 0};

      choice == 'Happy'
          ? userMood = "Happy"
          : choice == 'Tired'
          ? userMood = "Tired"
          : choice == "Angrey"
          ? userMood = "Angery"
          : userMood = "❓";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("How Do You Feel Today?"),
        SizedBox(height: 50),
        Text(
          userMood == "Happy"
              ? "😊"
              : userMood == 'Tired'
              ? "😴"
              : userMood == "Angrey"
              ? "😡"
              : "❓",
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => choose("Happy"),
              child: Text("😊 Happy"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => choose("Tired"),
              child: Text("😴 Tired"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => choose("Angrey"),
              child: Text("😡 Angrey"),
            ),
          ],
        ),
        SizedBox(height: 10),
        ElevatedButton(onPressed: () => choose("Reset"), child: Text("Reset")),
        SizedBox(height: 30),
        Text("😊 Happy: $countHappy"),
        Text("😴 Tired: $countTired"),
        Text("😡 Angrey: $countAngrey"),
      ],
    );
  }
}
