import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/view/screens/details_screen.dart';
import 'package:news_app/view/screens/home_screen.dart';

void main() async {
  // var newsModel = await ApiManager.getNews();
  // log(newsModel.status ?? "");
  // log(newsModel.articles?.first.title ?? "");
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: .light,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.details: (context) => DetailsScreen(),
      },
    );
  }
}
