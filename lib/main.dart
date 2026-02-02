import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mayung_media/themes/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mayung_media/test.dart';
// import 'package:http/http.dart' as http; // API sementara di-comment
// import 'dart:convert';
// import 'package:sqflite/sqflite.dart'; // Database sementara di-comment

void main() => runApp(
  MaterialApp(
    home: const MayungApp(),
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
  ),
);

class MayungApp extends StatefulWidget {
  const MayungApp({super.key});

  @override
  State<MayungApp> createState() => _MayungAppState();
}

class _MayungAppState extends State<MayungApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        title: Image.asset(
          'assets/images/logo_putih.webp',
          width: 50,
          height: 50,
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.list))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildFeaturedNews(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "TERKINI",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'judul',
                    letterSpacing: 2,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 1, color: Colors.white24),
              ),

              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildRecentNewsItemPlaceholder(),
                    _buildRecentNewsItemPlaceholder(),
                    _buildRecentNewsItemPlaceholder(),
                    _buildRecentNewsItemPlaceholder(),
                    _buildRecentNewsItemPlaceholder(),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: AppColors.secondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ALAM',
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'judul',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontFamily: 'primary',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(thickness: 1, color: Colors.white10),
                    const SizedBox(height: 16),
                    NewsItem(judul: "Misteri Alam Nusantara", kategori: "ALAM"),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BERDAYA',
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'judul',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontFamily: 'primary',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(thickness: 1, color: Colors.white10),
                    const SizedBox(height: 16),
                    _NewsPlaceholder(),

                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BUDAYA',
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'judul',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontFamily: 'primary',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(thickness: 1, color: Colors.white10),
                    const SizedBox(height: 16),
                    _NewsPlaceholder(),
                  ],
                ),
              ),
              //footer
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 25,
                  vertical: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo_putih.webp',
                      height: 80,
                      width: 80,
                    ),
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
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
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
              //EndFooter
            ],
          ),
        ),
      ),
    );
  }

  //WIDGET//
  Widget _buildFeaturedNews() {
    return Container(
      height: 300,
      width: double.infinity,
      child: ClipRRect(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/images/IMG_1344.JPG',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    color: Colors.blue,
                    child: const Text(
                      "Teknologi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Fakultas Teknik Universtas Hamzanwadi sukses menggelar INFORMATICS ROBOTICS INOVATION CUP 2026",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'judul',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Oleh Fathul Rakhman  •  30 January 2026",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentNewsItemPlaceholder() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250,
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

  // ignore: non_constant_identifier_names
  Widget _NewsPlaceholder() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
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
              // Kategori
              Container(
                height: 10,
                width: 60,
                color: Colors.blueAccent.withOpacity(0.3),
              ),
              const SizedBox(height: 12),
              // Judul
              Container(
                height: 18,
                width: double.infinity,
                color: Colors.white10,
              ),
              const SizedBox(height: 10),
              //Konten
              Container(
                height: 18,
                width: double.infinity,
                color: Colors.white10,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 18, width: 200, color: Colors.white10),
                  Container(height: 18, width: 200, color: Colors.white10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
