import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mayung_media/themes/themes.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String category;

  const DetailPage({super.key, required this.title, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("Detail Berita"),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: AppColors.primary,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        category.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'judul',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildAuthorSection(),
                      const SizedBox(height: 30),
                      _buildOverlappingImage(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.secondary,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            const Text(
                              textAlign: TextAlign.justify,
                              "Isi berita dimulai di sini... Mayung Media menyajikan informasi mendalam untuk masyarakat Nusa Tenggara Barat.",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Artikel Yang Mungkin Anda Suka',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'judul',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Divider(
                              thickness: 1,
                              color: AppColors.muted,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            _buildRecentNewsItemPlaceholder(),
                            SizedBox(height: 20),
                            _buildRecentNewsItemPlaceholder(),
                            SizedBox(height: 20),
                            _buildRecentNewsItemPlaceholder(),
                          ],
                        ),
                      ),
                      _buildFooter(context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET
  Widget _buildAuthorSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/author.webp',
            height: 45,
            width: 45,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Redaksi Mayung Media',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                const Text(
                  '02 Feb 2026',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                const SizedBox(width: 12),
                const FaIcon(
                  FontAwesomeIcons.solidEye,
                  size: 11,
                  color: Colors.white54,
                ),
                const SizedBox(width: 5),
                const Text(
                  '231 Views',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // WIDGET
  Widget _buildOverlappingImage() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 230,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.image_outlined,
            color: Colors.white10,
            size: 60,
          ),
        ),
      ],
    );
  }

  // WIDGET
  Widget _buildFooter(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo_putih.webp', height: 80, width: 80),
            SizedBox(height: 20),
            Text(
              'Mayung Media adalah kanal berita di Nusa Tenggara Barat. Kami menyajikan informasi secara lebih mendalam.',
              style: TextStyle(
                fontFamily: 'primary',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Hubungi Kami',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'mayung.id@gmail.com',
              style: TextStyle(
                fontFamily: 'primary',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Media Sosial',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.tiktok,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildRecentNewsItemPlaceholder() {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.image, color: Colors.white24, size: 40),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tag Kategori
              Container(
                height: 10,
                width: 60,
                color: Colors.blueAccent.withOpacity(0.3),
              ),
              const SizedBox(height: 12),
              // Baris Judl
              Container(height: 18, width: 250, color: Colors.white10),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 18, width: 100, color: Colors.white10),
                  Container(height: 18, width: 100, color: Colors.white10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }