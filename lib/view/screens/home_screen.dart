import 'package:flutter/material.dart';

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

class ItemCardNews extends StatelessWidget {
  const ItemCardNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageTest,
              height: 200,
              width: double.infinity,
              fit: .cover,
            ),
          ),
          Text("Europe", style: Theme.of(context).textTheme.titleSmall),
          Text(
            "Russian warship: Moskva sinks in Black Sea",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

String imageTest =
    "https://images.ctfassets.net/100cwma5ubtt/1GiiFUhJfnfFaV9apeWqYo/24d806d058e8892474c72197daec2486/FS_1440x810_cat-entertainment_7-reasons-you-should-adopt-a-cat.jpg?fm=webp&w=1200&q=50";
