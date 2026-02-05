import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mayung_media/recent_news.dart';
import 'package:mayung_media/themes/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mayung_media/news_item.dart';
// import 'package:http/http.dart' as http; // API
// import 'dart:convert';
// import 'package:sqflite/sqflite.dart'; // Database

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
                    RecentNews(
                      kategori: 'ALAM',
                      judul:
                          'Geopark Rinjani Ajak Anak Muda Menelusuri Jejak Pangan Lokal di Lombok Utara',
                      author: 'Redaksi Mayung Media',
                      konten:
                          "Di lereng perbukitan yang kering di Desa Karang Bajo, Kecamatan Bayan, Kabupaten Lombok Utara, sebuah gerakan konservasi tengah berlangsung. Para pemuda dari berbagai organisasi bersama komunitas masyarakat adat sedang berupaya memetakan kembali kekayaan pangan lokal yang kian tergerus zaman. Identifikasi ini bukan sekadar pendataan biologis, melainkan upaya menyelamatkan kedaulatan pangan di tengah ancaman krisis iklim.",
                      tanggal: '01-Februari-2026',
                      views: '231',
                      imagepath: 'assets/images/Alam.webp',
                    ),
                    RecentNews(
                      kategori: 'BERDAYA',
                      judul:
                          'Geopark Rinjani Ajak Anak Muda Menelusuri Jejak Pangan Lokal di Lombok Utara',
                      author: 'Redaksi Mayung Media',
                      konten:
                          "Di lereng perbukitan yang kering di Desa Karang Bajo, Kecamatan Bayan, Kabupaten Lombok Utara, sebuah gerakan konservasi tengah berlangsung. Para pemuda dari berbagai organisasi bersama komunitas masyarakat adat sedang berupaya memetakan kembali kekayaan pangan lokal yang kian tergerus zaman. Identifikasi ini bukan sekadar pendataan biologis, melainkan upaya menyelamatkan kedaulatan pangan di tengah ancaman krisis iklim.",
                      tanggal: '01-Februari-2026',
                      views: '231',
                      imagepath: 'assets/images/IMG_1344.JPG',
                    ),
                    RecentNews(
                      kategori: 'BUDAYA',
                      judul:
                          'Cupak Gerantang, Dari Dongeng Tidur Hingga Pentas Jalanan',
                      author: 'Redaksi Mayung Media',
                      konten:
                          "Tjoepak bebeling : ‘’ Adi’ Gerantang, tain apa ? / meni bele’ penoempoekna mara’ gili ?...",
                      tanggal: '27-Januari-2026',
                      views: '189',
                      imagepath: 'assets/images/budaya 2.webp',
                    ),

                    // BERITA 4: SUARA
                    RecentNews(
                      kategori: 'SUARA',
                      judul: 'Keluarga Nomaden di kawasan Wisata Medana',
                      author: 'Fathul Rakhman',
                      konten:
                          "Tinggal di kawasan pariwisata Medana tidak membuat hidup Kerta lebih baik. Bersama istri dan enam anaknya, Kerta hidup terlunta-lunta...",
                      tanggal: '27-Januari-2026',
                      views: '312',
                      imagepath: 'assets/images/SUARA 2.webp',
                    ),
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
                    NewsItem(
                      judul:
                          "Geopark Rinjani Ajak Anak Muda Menelusuri Jejak Pangan Lokal di Lombok Utara",
                      kategori: "ALAM",
                      konten:
                          "Di lereng perbukitan yang kering di Desa Karang Bajo, Kecamatan Bayan, Kabupaten Lombok Utara, sebuah gerakan konservasi tengah berlangsung. Para pemuda dari berbagai organisasi bersama komunitas masyarakat adat sedang berupaya memetakan kembali kekayaan pangan lokal yang kian tergerus zaman. Identifikasi ini bukan sekadar pendataan biologis, melainkan upaya menyelamatkan kedaulatan pangan di tengah ancaman krisis iklim.",
                      tanggal: '01-02-2006',
                      author: 'Redaksi Mayung Media',
                      Imagepath: 'assets/images/Alam.webp',
                    ),
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
                    NewsItem(
                      judul:
                          "Fakultas Teknik Universtas Hamzanwadi sukses menggelar INFORMATICS ROBOTICS INOVATION CUP 2026",
                      kategori: "BERDAYA",
                      konten:
                          "Fakultas Teknik Universitas Hamzanwadi sukses menuntaskan perhelatan bergengsi Informatics Robotic Innovation Cup (IRIC) 2026. Dimulai sejak Jumat (23/01), ajang ini berhasil menjadi panggung inovasi bagi talenta-talenta muda di bidang teknologi dan robotika.",
                      tanggal: '27-01-2006',
                      author: 'Redaksi Mayung Media',
                      Imagepath: 'assets/images/IMG_1344.JPG',
                    ),

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
                    NewsItem(
                      judul:
                          "Cupak Gerantang, Dari Dongeng Tidur Hingga Pentas Jalanan",
                      kategori: "BUDAYA",
                      konten:
                          "Tjoepak bebeling : ‘’ Adi’ Gerantang, tain apa ? / meni bele’ penoempoekna mara’ gili ? / ‘’ Ia mene’ tain Limandaroeng ‘’ / Lo’ Tjoepak gigit perangenna / peno’ sedo’ gigi ngerejot soegoel daoer / ‘’ Doeh mas mirah adi’ Gerantang, ente pada oele’ malik ‘’",
                      tanggal: '27-01-2006',
                      author: 'Redaksi Mayung Media',
                      Imagepath: 'assets/images/budaya 2.webp',
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUARA',
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
                    NewsItem(
                      judul: "Keluarga Nomaden di kawasann Wisata",
                      kategori: "SUARA",
                      konten:
                          "Tinggal di kawasan pariwisata Medana, Kecamatan Tanjung, Kabupaten Lombok Utara tidak membuat hidup Kerta lebih baik. Bersama istri dan enam orang anaknya, Kerta hidup terlunta-lunta. Pindah dari satu tanah kosong ke tanah kosong lainnya. Kadang membuat gubuk di pinggir pantai. Dia tidak terlahir sebagai orang terlantar, keluarganya pernah memiliki tanah di kawasan pariwisata itu. Di tanah bekas milik keluarganya itulah Kerta menumpang. Inilah kisah tentang Kerta dan ‘’orang-orang kalah’’ di kawasan pariwisata.",
                      tanggal: '27-01-2006',
                      author: 'Fathul Rakhman',
                      Imagepath: 'assets/images/SUARA 2.webp',
                    ),
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
                      "BERDAYA",
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
                    "Oleh Redaksi Mayung Media  •  27 January 2026",
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
}