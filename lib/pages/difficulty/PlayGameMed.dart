import 'dart:async';
import 'dart:html';

import 'package:finals_trainyourmath/pages/difficulty/CountDownTimerState.dart';
import 'package:flutter/material.dart';
import '../generateQuestion.dart';


class PlayGameMed extends StatefulWidget {
  const PlayGameMed({super.key});

  @override
  State<PlayGameMed> createState() => _PlayGameMedState();
}



class _PlayGameMedState extends State<PlayGameMed> {
  static const maxSeconds = 90.0;
  double seconds = maxSeconds;
  Timer? timer;
  bool isPaused = false;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {

      if (isPaused == false) {
      
        if (seconds > 0) {
          setState(() {seconds--;checkTimer();});
        } else {
          onPaused();
        }
      }
      
    });
  }

  void onPaused() {
    timer?.cancel();
  }


  late MathProblem currentProblem;
  int score = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
    generateNewProblem(); // Generate the first problem when the game starts
    print("PLAY");
  }

  void generateNewProblem() {
    // Generate a random problem
    currentProblem = random.nextBool() ? generateAdditionProblem() : generateSubstractionProblem();
  }



  void checkAnswer(String selectedAnswer) {

    if (isPaused == true) {
      isPaused = false;
    }
    if (selectedAnswer == currentProblem.correctAnswer) {
      score += 1;
      if (seconds <= 90) {
        seconds += 5;
      }
      // Correct answer
      // Generate a new problem
      generateNewProblem();
      // Update the UI to display the new problem
      setState(() {});
    } else {
      // Incorrect answer
      // Handle incorrect answer logic here if needed
      if (seconds >= 11) {
        seconds -= 10; 
      } else {
        seconds = 0.000000001;
      }
    }
  }

  void endGame() {
  // Pop the context when the game ends
  Navigator.pushNamed(context, '/Score', 
  arguments: {
    'score': '$score',
    'mode': 'Medium'
  });
}

  void checkTimer () {
    if (seconds <= 0) {
      endGame();
    }
  }
  

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          'assets/Background.png', // Replace this with the actual path to your image
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [

              SizedBox(height: 20,),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      isPaused = true;
                      Navigator.pushNamed(context, '/Pause');
                    },
                    icon: const Icon(
                      Icons.pause,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Expanded( // Added Expanded widget here
                    child: Center(
                      child: Text('${seconds}',
                            style: TextStyle(
                              fontSize: 30, color: Colors.red.shade900,
                              fontWeight: FontWeight.w900
                            ),),
                          ),
                        ),
                    Text('${score}',
                  style: TextStyle(
                            fontSize: 30, color: Colors.green.shade800,
                            fontWeight: FontWeight.w900,
                          ),),
                  const SizedBox(width: 50,)
                ],
              ),


              Container(
                width: 347,
                height: 191,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0x99000000)
                ),
                child: Column(children: [
                  SizedBox(height: 40,),
                  Text(
                    currentProblem.questionFirst, // Should have the questionFirst 
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),

                  Text(
                    currentProblem.questionOperation, // Should have the questionOperation
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),

                  Text(
                    currentProblem.questionSecond, // Should have the questionSecond
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),
                ],),
              ),

              const SizedBox(height: 20,),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(currentProblem.options[0]);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    child: Center(
                      child: Text(
                        currentProblem.options[0],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(currentProblem.options[1]);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    child: Center(
                      child: Text(
                        currentProblem.options[1],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(currentProblem.options[2]);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    child: Center(
                      child: Text(
                        currentProblem.options[2],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(currentProblem.options[3]);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    child: Center(
                      child: Text(
                        currentProblem.options[3],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    
                  ),
                ),
              ],
            ),

            ],
          ),
        )
        ]);
  }
}