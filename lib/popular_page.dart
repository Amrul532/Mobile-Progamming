import 'package:flutter/material.dart';
import 'detail_page.dart';

class PopularPage extends StatelessWidget {
  final List<Map<String, String>> animeList = [
    {
      'title': 'Naruto',
      'image':
          'https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/02/naruto-series.jpg?q=50&fit=crop&w=480&dpr=1.5',
    },
    {
      'title': 'One Piece',
      'image':
          'https://www.viu.com/ott/id/articles/wp-content/uploads/2021/07/streaming-download-anime-one-piece-sub-indo-viu.jpg',
    },
    {
      'title': 'Attack on Titan',
      'image':
          'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/02/erens-final-plan-aot.jpg?q=50&fit=crop&w=1140&h=&dpr=1.5',
    },
    {
      'title': 'Demon Slayer',
      'image':
          'https://statik.tempo.co/data/2023/06/20/id_1213419/1213419_720.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime Populer"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: animeList.length,
          itemBuilder: (context, index) {
            final anime = animeList[index];
            return Card(
              color: Colors.white.withOpacity(0.8),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    anime['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  anime['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: anime['title']!,
                        imageUrl: anime['image']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
