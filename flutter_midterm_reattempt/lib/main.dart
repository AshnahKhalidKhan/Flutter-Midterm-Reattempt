import 'package:flutter/material.dart';
import 'package:flutter_midterm_reattempt/MidtermExam.dart';

void main() 
{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget 
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      // home: CodeLab1Buttons(),
      // home: CodeLab2Grids(),
      // home: MidtermMockQuiz(),
      // home: GridPracticeDummyJSONPhotos(),
      // home: GridPracticeDummyJSONJustPictures(),
      // home: GridPracticeJSONPlaceholderPhotos(),
      // home: GridPracticeCard(),
      // home: GridPracticeModalBottomSheet(),
      home: MidtermExam()
    );
  }
}
