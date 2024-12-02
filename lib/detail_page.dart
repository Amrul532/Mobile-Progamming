import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage({required this.title, required String imageUrl});

  // Map nama anime ke URL gambar
  final Map<String, String> animeImages = {
    'Naruto':
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/02/naruto-series.jpg?q=50&fit=crop&w=480&dpr=1.5',
    'One Piece':
        'https://www.viu.com/ott/id/articles/wp-content/uploads/2021/07/streaming-download-anime-one-piece-sub-indo-viu.jpg',
    'Attack on Titan':
        'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/02/erens-final-plan-aot.jpg?q=50&fit=crop&w=1140&h=&dpr=1.5',
    'Demon Slayer':
        'https://statik.tempo.co/data/2023/06/20/id_1213419/1213419_720.jpg',
    'My Hero Academia':
        'https://imgsrv.crunchyroll.com/cdn-cgi/image/fit=contain,format=auto,quality=85,width=1200,height=675/catalog/crunchyroll/9ca680632ac63f44c7220f61ace9a81b.jpg',
    'Jujutsu Kaisen':
        'https://asset.kompas.com/crops/tNkKlDBSLHlzrR5eZWBtEhbVgwo=/0x0:0x0/750x500/data/photo/buku/6449f212a5b73.jpg',
    'Chainsaw Man':
        'https://cdns.klimg.com/resized/646x323/p/headline/sinopsis-anime-chainsaw-man-beserta-daf-74e370.jpg',
    'Spy x Family':
        'https://assets.kompasiana.com/items/album/2022/06/05/spy-x-family-25-episode-629c8ef4bb44865b2e4577f5.jpg?t=o&v=740&x=416',
    'Blue Lock':
        'https://assets.ggwp.id/2024/04/Blue-Lock-Project-World-Champion-640x360.jpg',
    'Classroom Of The Elite':
        'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/243/2024/08/14/adwadw-654156789.jpg',
    'Black Clover':
        'https://asset-2.tstatic.net/medan/foto/bank/images/Anime-Black-Clover.jpg',
    'Hunter X Hunter':
        'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/239/2024/04/28/30ff23fd-a182-4ebb-a5de-24be14899166-4264054320.jpg',
    'Fairy Tail':
        'https://www.viu.com/ott/id/articles/wp-content/uploads/2021/02/Fairy-Tail-Season-8_Slide-Banner.jpg',
  };

  @override
  Widget build(BuildContext context) {
    // Cek apakah ada gambar untuk judul anime, jika tidak gunakan gambar default
    final imageUrl = animeImages[title] ??
        'https://via.placeholder.com/300x400.png?text=No+Image';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade300, Colors.red.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tombol kembali ke Home
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(
                              context); // Kembali ke halaman sebelumnya
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Detail Anime",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Informasi Anime",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Anime $title adalah salah satu seri populer yang banyak diminati penggemar anime di seluruh dunia. Nikmati cerita, aksi, dan petualangan menarik dari anime ini.",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Genre dan Detail",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "- Genre: Aksi, Petualangan\n- Studio: Studio terkenal\n- Rilis: Tahun rilis",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tombol kembali ke Home
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.popUntil(
                            context,
                            (route) =>
                                route.isFirst); // Kembali ke halaman Home
                      },
                      icon: const Icon(Icons.home),
                      label: const Text("Kembali ke Home"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
