import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'popular_page.dart';
import 'category_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> animeList = [
    {
      'title': 'Naruto',
      'image':
          'https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/02/naruto-series.jpg?q=50&fit=crop&w=480&dpr=1.5'
    },
    {
      'title': 'One Piece',
      'image':
          'https://www.viu.com/ott/id/articles/wp-content/uploads/2021/07/streaming-download-anime-one-piece-sub-indo-viu.jpg'
    },
    {
      'title': 'Attack on Titan',
      'image':
          'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/02/erens-final-plan-aot.jpg?q=50&fit=crop&w=1140&h=&dpr=1.5'
    },
    {
      'title': 'Demon Slayer',
      'image':
          'https://statik.tempo.co/data/2023/06/20/id_1213419/1213419_720.jpg'
    },
    {
      'title': 'My Hero Academia',
      'image':
          'https://imgsrv.crunchyroll.com/cdn-cgi/image/fit=contain,format=auto,quality=85,width=1200,height=675/catalog/crunchyroll/9ca680632ac63f44c7220f61ace9a81b.jpg'
    },
  ];

  List<Map<String, String>> searchResults = [];

  void _searchAnime(String query) {
    final results = animeList.where((anime) {
      final title = anime['title']!.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar untuk mengubah AppBar yang menempel di atas
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height *
                0.3, // Menyesuaikan tinggi header
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.pikbest.com/ai/illus_our/20230422/1d7a3f4711c1dcbc77e6682c9c51c741.jpg!w700wp',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            pinned: true, // Menjaga app bar tetap terlihat saat scroll
          ),

          // Bagian konten utama yang bisa di-scroll
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color:
                    Colors.black.withOpacity(0.5), // Untuk teks lebih kontras
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Info anime apa yang kamu butuhkan?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Search bar dengan desain
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade700,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              onChanged: _searchAnime,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Masukkan judul anime...",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Aksi ikon mikrofon
                            },
                            child: Icon(Icons.mic, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Menampilkan hasil pencarian anime jika ada
                    if (searchResults.isNotEmpty)
                      Column(
                        children: searchResults.map((anime) {
                          return ListTile(
                            leading: Image.network(anime['image']!),
                            title: Text(
                              anime['title']!,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    title: anime['title']!,
                                    imageUrl: '',
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    const SizedBox(height: 20),
                    const Text(
                      "Kategori",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryButton(
                            context, "Anime Populer", PopularPage()),
                        _buildCategoryButton(
                            context, "Anime Terbaru", CategoryPage()),
                        _buildCategoryButton(
                            context, "Favorit", FavoritePage()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Rekomendasi Anime",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: animeList.map((anime) {
                          return GestureDetector(
                            onTap: () {
                              // Ketika anime ditekan, menuju ke halaman detail
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    title: anime['title']!,
                                    imageUrl: '',
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.only(right: 10),
                              color: Colors.black.withOpacity(0.7),
                              child: Column(
                                children: [
                                  Image.network(
                                    anime['image']!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      anime['title']!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String label, Widget destination) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Text(label),
    );
  }
}
