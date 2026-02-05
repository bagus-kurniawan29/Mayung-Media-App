import 'package:flutter/material.dart';
import 'package:mayung_media/detail_page.dart';

class RecentNews extends StatelessWidget {
  final String kategori;
  final String judul;
  final String author;
  final String konten;
  final String tanggal;
  final String views;
  final String imagepath;
  const RecentNews({
    super.key,
    required this.kategori,
    required this.judul,
    required this.konten,
    required this.author,
    required this.tanggal,
    required this.views,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    Color TextColor;
    switch (kategori.toUpperCase()) {
      case 'ALAM':
        TextColor = Colors.green;
        break;
      case 'BERDAYA':
        TextColor = Colors.orange;
        break;
      case 'BUDAYA':
        TextColor = Colors.brown;
        break;
      case 'SUARA':
        TextColor = Colors.blueGrey;
        break;
      default:
        TextColor = Colors.grey;
    }
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: judul,
              category: kategori,
              konten: konten,
              tanggal: tanggal,
              author: author,
              Imagepath: imagepath,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        width: 250,
        height: 500,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(imagepath),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag Kategori
                Text(
                  kategori,
                  style: TextStyle(
                    color: TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // Baris Judl
                Text(
                  judul,
                  style: TextStyle(
                    fontFamily: 'judul',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(author),
                    SizedBox(width: 20),
                    Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                    Text(views),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
