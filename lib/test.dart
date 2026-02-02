import 'package:flutter/material.dart';
import 'detail_page.dart'; // Import halaman detail yang akan kamu buat

class NewsItem extends StatelessWidget {
  final String judul;
  final String kategori;

  const NewsItem({super.key, required this.judul, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Agar background secondary tetap terlihat
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman detail
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailPage(title: judul, category: kategori),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Gambar Placeholder
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

              // 2. Kategori
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                color: Colors.blueAccent.withOpacity(0.3),
                child: Text(
                  kategori,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 3. Judul Berita
              Text(
                judul,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'judul',
                ),
              ),
              const SizedBox(height: 8),

              // 4. Deskripsi singkat / Dummy teks
              Container(
                height: 15,
                width: double.infinity,
                color: Colors.white10,
              ),
              const SizedBox(height: 5),
              Container(height: 15, width: 150, color: Colors.white10),
            ],
          ),
        ),
      ),
    );
  }
}
