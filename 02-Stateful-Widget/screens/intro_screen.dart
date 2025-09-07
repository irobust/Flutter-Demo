import 'package:flutter/material.dart';
import 'package:mindful_app/screens/settings_screen.dart';

import '../data/sp_hemler.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String name = '';
  String image = 'lake';

  @override
  void initState() {
    super.initState();
    final helper = SPHelper();
    helper.getSettings().then((settings) {
      name = settings['name'] ?? '';
      image = settings['image'] ?? 'lake';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/$image.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Align(
          alignment: const Alignment(0, -0.5),
          child: Text('Welcome $name',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ))),
      Align(
          alignment: const Alignment(0, 0.5),
          child: ElevatedButton(
            child: const Text('Start'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext context) => const SettingsScreen()),
              );
            },
          )),
    ]));
  }
}
