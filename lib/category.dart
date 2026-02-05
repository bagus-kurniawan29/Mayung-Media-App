import 'package:flutter/material.dart';
import 'package:mayung_media/news_item.dart';

class CategoryPage extends StatelessWidget {
  final String namaKategori;
  const CategoryPage({super.key, required this.namaKategori});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> semuaBerita = [
      {
        'kategori': 'ALAM',
        'judul': 'Geopark Rinjani & Pangan Lokal',
        'img': 'assets/images/Alam.webp',
        'auth': 'Redaksi',
      },
      {
        'kategori': 'SUARA',
        'judul': 'Keluarga Nomaden Medana',
        'img': 'assets/images/SUARA 2.webp',
        'auth': 'Fathul',
      },
      {
        'kategori': 'BERDAYA',
        'judul': 'Sukses Gelar IRIC 2026',
        'img': 'assets/images/IMG_1344.JPG',
        'auth': 'Redaksi',
      },
      {
        'kategori': 'BUDAYA',
        'judul': 'Cupak Gerantang Tradisi Sasak',
        'img': 'assets/images/budaya 2.webp',
        'auth': 'Redaksi',
      },
    ];

    final filteredData = semuaBerita
        .where((e) => e['kategori'] == namaKategori.toUpperCase())
        .toList();

    Color warnaHeader;
    switch (namaKategori.toUpperCase()) {
      case 'ALAM':
        warnaHeader = Colors.green;
        break;
      case 'BERDAYA':
        warnaHeader = Colors.orange;
        break;
      case 'BUDAYA':
        warnaHeader = Colors.brown;
        break;
      case 'SUARA':
        warnaHeader = Colors.blueGrey;
        break;
      default:
        warnaHeader = Colors.white;
    }
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "KATEGORI",
              style: TextStyle(color: Colors.white54, letterSpacing: 4),
            ),
            Text(
              namaKategori,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: warnaHeader,
                fontFamily: 'judul',
              ),
            ),
            const SizedBox(height: 30),
            if (filteredData.isEmpty)
              const Text(
                "Belum ada berita.",
                style: TextStyle(color: Colors.white),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: NewsItem(
                      judul: filteredData[index]['judul']!,
                      kategori: namaKategori,
                      konten: "Membahas tuntas mengenai $namaKategori di NTB.",
                      tanggal: "05 Feb 2026",
                      author: filteredData[index]['auth']!,
                      Imagepath: filteredData[index]['img']!,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
