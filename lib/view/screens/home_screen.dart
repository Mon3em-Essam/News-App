import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/item_card_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: Column(children: [ItemCardNews()]),
    );
  }
}



String imageTest =
    "https://images.ctfassets.net/100cwma5ubtt/1GiiFUhJfnfFaV9apeWqYo/24d806d058e8892474c72197daec2486/FS_1440x810_cat-entertainment_7-reasons-you-should-adopt-a-cat.jpg?fm=webp&w=1200&q=50";
