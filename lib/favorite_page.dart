import 'package:flutter/material.dart';
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, String>> animeList = [
    {
      'title': 'Classroom Of The Elite',
      'image':
          'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/243/2024/08/14/adwadw-654156789.jpg',
    },
    {
      'title': 'Black Clover',
      'image':
          'https://asset-2.tstatic.net/medan/foto/bank/images/Anime-Black-Clover.jpg',
    },
    {
      'title': 'Hunter X Hunter',
      'image':
          'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/239/2024/04/28/30ff23fd-a182-4ebb-a5de-24be14899166-4264054320.jpg',
    },
    {
      'title': 'Fairy Tail',
      'image':
          'https://www.viu.com/ott/id/articles/wp-content/uploads/2021/02/Fairy-Tail-Season-8_Slide-Banner.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime Favorit"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
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
