import 'package:flutter/material.dart';
import 'ScoreItem.dart';
import 'package:finals_trainyourmath/pages/ScoreFile.dart';

class Score extends StatefulWidget {

  const Score({Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  

  List<ScoreFile> _scores = [];

  void appendScoreToList(String mode, int score) {
    setState(() {
      _scores.add(ScoreFile(mode: mode, score: score));
    });
  }


@override
Widget build(BuildContext context) {

  final args = ModalRoute.of(context)?.settings.arguments as Map?;
  if (args != null) {
    appendScoreToList(args['mode'], int.parse(args['score']));
  } else {
    appendScoreToList('No Data', 0);
  }
  
  return Stack(
    fit: StackFit.expand,
    children: [
      // Background image
      Image.asset(
        'assets/Background.png', // Replace this with the actual path to your image
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent, // Make scaffold transparent
        body: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "SCORE",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: 'zuka-doodle-font',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "MODE",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        "SCORE",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Display score items
                  Expanded(
                    child: ListView.builder(
                      itemCount: _scores.length,
                      itemBuilder: (context, index) {
                        _scores.sort((a, b) => b.score.compareTo(a.score));
                        final score = _scores[index].score;
                        final mode =_scores[index].mode;
                        return ScoreItem(mode, score);
                      },
                    ),
                  ),

                  const SizedBox(height: 20,),


                  Row(
                children: [
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popUntil(ModalRoute.withName("/"));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "BACK",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
                ],

              ),
            ),
          ],
        ),
      ),
    ],
  );
}
}
