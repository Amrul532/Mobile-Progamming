import 'package:flutter/material.dart';
import 'detail_page.dart';

class CategoryPage extends StatelessWidget {
  final List<Map<String, String>> animeList = [
    {
      'title': 'Jujutsu Kaisen',
      'image':
          'https://asset.kompas.com/crops/tNkKlDBSLHlzrR5eZWBtEhbVgwo=/0x0:0x0/750x500/data/photo/buku/6449f212a5b73.jpg',
    },
    {
      'title': 'Chainsaw Man',
      'image':
          'https://cdns.klimg.com/resized/646x323/p/headline/sinopsis-anime-chainsaw-man-beserta-daf-74e370.jpg',
    },
    {
      'title': 'Spy x Family',
      'image':
          'https://assets.kompasiana.com/items/album/2022/06/05/spy-x-family-25-episode-629c8ef4bb44865b2e4577f5.jpg?t=o&v=740&x=416',
    },
    {
      'title': 'Blue Lock',
      'image':
          'https://assets.ggwp.id/2024/04/Blue-Lock-Project-World-Champion-640x360.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime Kategori"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
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
