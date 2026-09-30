import 'package:flutter/material.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/widgets/item_card_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isLoading = true;
  String? error;
  @override
  void initState() {
    super.initState();
    getArtticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: isLoading
          ? _loadingView()
          : error != null
          ? _errorView()
          : _successView(),
    );
  }

  Widget _successView() {
    return ListView.builder(
      itemBuilder: (context, index) => ItemCardNews(article: articles[index]),
      itemCount: articles.length,
    );
  }

  Widget _loadingView() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _errorView() {
    return Center(
      child: Text(
        error!,
        style: TextStyle(
          fontSize: 30,
          color: const Color.fromARGB(255, 189, 2, 2),
        ),
      ),
    );
  }

  void getArtticles() async {
    final result = await ApiManager.getNews();
    // articles = newsModel.articles ?? [];

    switch (result) {
      case Success<NewsModel>():
        articles = result.data.articles ?? [];
      case Error<NewsModel>():
        error = result.error;
    }
    isLoading = false;
    setState(() {});
  }
}

String imageTest =
    "https://images.ctfassets.net/100cwma5ubtt/1GiiFUhJfnfFaV9apeWqYo/24d806d058e8892474c72197daec2486/FS_1440x810_cat-entertainment_7-reasons-you-should-adopt-a-cat.jpg?fm=webp&w=1200&q=50";
