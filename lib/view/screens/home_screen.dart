import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/home_cubit.dart';
import 'package:news_app/cubit/home_state.dart';
import 'package:news_app/data/news_model.dart';
import 'package:news_app/view/widgets/item_card_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getArticles(),
      child: Scaffold(
        appBar: AppBar(title: Text("News")),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return _loadingView();
            } else if (state is HomeError) {
              return _errorView(state.error);
            } else if (state is HomeSuccess) {
              return _successView(state.articles);
            }
            return _loadingView();
          },
        ),
      ),
    );
  }

  Widget _successView(List<Article> articles) {
    return ListView.builder(
      itemBuilder: (context, index) => ItemCardNews(article: articles[index]),
      itemCount: articles.length,
    );
  }

  Widget _loadingView() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _errorView(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          fontSize: 30,
          color: const Color.fromARGB(255, 189, 2, 2),
        ),
      ),
    );
  }
}

String imageTest =
    "https://images.ctfassets.net/100cwma5ubtt/1GiiFUhJfnfFaV9apeWqYo/24d806d058e8892474c72197daec2486/FS_1440x810_cat-entertainment_7-reasons-you-should-adopt-a-cat.jpg?fm=webp&w=1200&q=50";
