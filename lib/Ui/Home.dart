import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("ABUJA is the capital of Nigeria?", true),
    Question.name("Lagos was the capital of Nigeria until 1991?", true),
    Question.name("Nigeria has coast on the Gulf of Guinea?", true),
    Question.name(
        "Nigeria is a former colony of the French Colonial Empire?", false),
    Question.name("Nigeria uses the dollar as it's currency?", false),
    Question.name(
        "Nigeria's population is projected to surpass the United States' by the year 2050?",
        true),
    Question.name("Nigeria left the Commonwealth of Nations in 2010?", false),
    Question.name(
        "Nollywood, Nigeria's film industry, is one of the biggest in the world?",
        true),
    Question.name(
        "Urdu is a language spoken by over 45 million Nigerians?", false),
    Question.name(
        "There is a large monolith called Zuma Rock just west of Abuja?", true),
    Question.name("Nigerians drive on the right side of the road?", false),
    Question.name("Kano is Nigeria's third largest city by population", true),
    Question.name("Nigeria have 250 ethnic groups?", true),
    Question.name(
        "In Nigeria, democracy day is now celebrated on June 12?", true),
    Question.name("Nigeria become independent in 1960?", true),
    Question.name(
        "Biafra was the region that declared its independence from Nigeria in 1967 and was unsuccessful?",
        true),
    Question.name("1 December is National Day in Nigeria?", false),
    Question.name(
        "Usman dan Fodio is the first ruler of Sokoto Caliphate?", true),
    Question.name("Nigeria have 51 States And 36 Capitals?", false),
    Question.name("Nigeria Is The Largest Economy In Africa?", true),
    Question.name("One Of The Biggest Exports Of Nigeria Is Oil?", true),
    Question.name("Nigeria is often called the GIANT OF AFRICA?", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade100,
      ),
      backgroundColor: Colors.orange.shade100,
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "images/COAT.png",
                  width: 250,
                  height: 180,
                )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.4),
                        border: Border.all(
                          color: Colors.green,
                          style: BorderStyle.solid,
                        )),
                    height: 120.0,
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: const TextStyle(
                          fontSize: 17.9,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                      ),
                    ),
                        )),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  ElevatedButton(
                    onPressed: () => _checkAnswer(true, context),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: const Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(false, context),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: const Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _newQuestion(), style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),),
                    child: const Icon(Icons.arrow_forward),
                      )
                ]),
                const Spacer(),
              ],
            ),
          );
        }
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
     const snackBar = SnackBar(content: Text("Correct!"));
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      debugPrint("Correct!");

    }else{
      debugPrint("Incorrect!");
      const snackBar = SnackBar(content: Text("InCorrect!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  _newQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });

  }
}
