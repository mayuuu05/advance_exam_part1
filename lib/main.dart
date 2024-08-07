import 'package:advance_exam_part1/provider/quoteProvider.dart';
import 'package:advance_exam_part1/view/favourite_screen/favourite_screen.dart';
import 'package:advance_exam_part1/view/home_screen/home_screen.dart';
import 'package:advance_exam_part1/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AdvanceExam());
}

class AdvanceExam extends StatelessWidget {
  const AdvanceExam({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuoteProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>const SplashScreen(),
          '/home':(context)=>const HomeScreen(),
          '/like':(context)=>const FavouriteScreen(),
        },
      ),
    );
  }
}

