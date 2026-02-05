import 'package:flutter/material.dart';
import 'detail_page.dart';

class NewsItem extends StatelessWidget {
  final String judul;
  final String kategori;
  final String konten;
  final String tanggal;
  final String author;
  final String Imagepath;
  const NewsItem({
    super.key,
    required this.judul,
    required this.kategori,
    required this.konten,
    required this.tanggal,
    required this.author,
    required this.Imagepath,
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                title: judul,
                category: kategori,
                konten: konten,
                tanggal: tanggal,
                author: author,
                Imagepath: Imagepath,
            
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  Imagepath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),

              // 2. Kategori
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  kategori,
                  style: TextStyle(
                    color: TextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 3. Judul
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

              // 4. Deskripsi
              Text(
                konten,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'primary',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    author,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(tanggal),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
