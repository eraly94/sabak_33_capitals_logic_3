import 'package:flutter/material.dart';
import 'package:sabak_33_capitals_logic_3/constants/app_colors.dart';
import 'package:sabak_33_capitals_logic_3/view/home.view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        appBarTheme: const AppBarTheme(color: AppColors.appColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        sliderTheme: SliderThemeData(thumbShape: SliderComponentShape.noThumb),
      ),
      home: const HomeWiew(),
    );
  }
}
