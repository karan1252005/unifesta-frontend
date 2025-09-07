import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unifesta/screens/welcome_screen.dart';

class SpinScreen extends StatefulWidget {
  const SpinScreen({super.key});

  @override
  State<SpinScreen> createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {
  final List<String> finalLetters = ['U', 'n', 'i', 'f', 'e', 's', 't', 'a'];
  final List<String> alphabet = List.generate(26, (i) => String.fromCharCode(97 + i));
  late List<String> currentLetters;

  int currentIndex = 0;
  bool showFinalWord = false;

  @override
  void initState() {
    super.initState();
    
    currentLetters = List.generate(8, (index) => alphabet[Random().nextInt(26)]);
    flipLetterAtIndex(currentIndex);
  }

  void flipLetterAtIndex(int index) {
    int position = 0;
    int target = alphabet.indexOf(finalLetters[index].toLowerCase());

    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        currentLetters[index] = alphabet[position];
      });

      if (position == target) {
        timer.cancel();
        if (index + 1 < finalLetters.length) {
          flipLetterAtIndex(index + 1);
        } else {
          
          setState(() {
            currentLetters = finalLetters;
            showFinalWord = true;
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  WelcomeScreen()),
            );
          });
        }
      } else {
        position++;
      }
    });
  }

  Widget buildLetter(String letter, int index) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (child, animation) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
      child: Text(
        index == 0 ? letter.toUpperCase() : letter,
        key: ValueKey(letter + index.toString()),
        style: GoogleFonts.caveat(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639), 
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(8, (i) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: buildLetter(currentLetters[i], i),
            );
          }),
        ),
      ),
    );
  }
}


