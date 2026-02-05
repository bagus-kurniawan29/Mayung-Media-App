import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mayung_media/themes/themes.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String category;
  final String konten;
  final String tanggal;
  final String author;
  final String Imagepath;

  const DetailPage({
    super.key,
    required this.title,
    required this.category,
    required this.konten,
    required this.tanggal,
    required this.author,
    required this.Imagepath,
  });

  @override
  Widget build(BuildContext context) {
    Color categoryColor;
    switch (category.toUpperCase()) {
      case 'ALAM':
        categoryColor = Colors.green;
        break;
      case 'BUDAYA':
        categoryColor = Colors.brown;
        break;
      case 'BERDAYA':
        categoryColor = Colors.orange;
        break;
      case 'SUARA':
        categoryColor = Colors.blueGrey;
      default:
        categoryColor = Colors.grey;
    }
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("Detail Berita"),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.primary,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      category.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'judul',
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildAuthorSection(author, tanggal),
                ],
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildOverlappingImage(Imagepath),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    konten,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 20),
                  const Text(
                    'Artikel Yang Mungkin Anda Suka',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildRecentNewsItemPlaceholder(),
                  _buildRecentNewsItemPlaceholder(),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            // FOOTER
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorSection(String name, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/author.webp'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$date • 231 Views",
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverlappingImage(String path) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          path,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo_putih.webp', height: 60),
          const SizedBox(height: 20),
          const Text(
            'Mayung Media menyajikan informasi mendalam seputar Nusa Tenggara Barat.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 30),
          const Text(
            'Media Sosial',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentNewsItemPlaceholder() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.image, color: Colors.white24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: 60,
                  color: Colors.blue.withOpacity(0.3),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Colors.white10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
