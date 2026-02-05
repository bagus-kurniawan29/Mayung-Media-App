import 'package:flutter/material.dart';
import 'package:mayung_media/recent_news.dart';
import 'package:mayung_media/themes/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mayung_media/news_item.dart';
import 'package:mayung_media/category.dart';
import 'dart:async';

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
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _featuredData = [
    {
      'kategori': 'BERDAYA',
      'judul':'Fakultas Teknik Universitas Hamzanwadi sukses menggelar IRIC 2026',
      'image': 'assets/images/IMG_1344.JPG',
      'date': '27 January 2026',
    },
    {
      'kategori': 'ALAM',
      'judul': 'Menelusuri Jejak Pangan Lokal di Lereng Rinjani Lombok Utara',
      'image': 'assets/images/Alam.webp',
      'date': '01 February 2026',
    },
    {
      'kategori': 'BUDAYA',
      'judul': 'Cupak Gerantang: Dari Dongeng Tidur Hingga Pentas Jalanan',
      'image': 'assets/images/Budaya 2.webp',
      'date': '27 January 2026',
    },
  ];
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _featuredData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutQuint,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
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
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    RecentNews(
                      kategori: 'ALAM',
                      judul:'Geopark Rinjani Ajak Anak Muda Menelusuri Jejak Pangan Lokal di Lombok Utara',
                      author: 'Redaksi Mayung Media',
                      konten:"Upaya pemetaan kembali kekayaan pangan lokal di Desa Karang Bajo sebagai langkah penyelamatan kedaulatan pangan di tengah ancaman krisis iklim global.",
                      views: '231',
                      tanggal: '01-2-2026',
                      imagepath: 'assets/images/Alam.webp',
                    ),
                    RecentNews(
                      kategori: 'BERDAYA',
                      judul:'Fakultas Teknik Hamzanwadi Sukses Gelar Informatics Robotic Innovation Cup 2026',
                      author: 'Redaksi Mayung Media',
                      konten:"Ajang IRIC 2026 menjadi panggung inovasi bagi talenta muda. Kompetisi ini berhasil menarik antusiasme peserta hingga dari luar Pulau Lombok.",
                      views: '452',
                      tanggal: '01-2-2026',
                      imagepath: 'assets/images/IMG_1344.JPG',
                    ),
                    RecentNews(
                      kategori: 'BUDAYA',
                      judul:'Cupak Gerantang: Dari Dongeng Tidur Hingga Pentas Jalanan',
                      author: 'Redaksi Mayung Media',
                      konten:"Menelusuri jejak tradisi lisan Sasak, Cupak Gerantang bukan sekadar dongeng, melainkan refleksi karakter manusia yang tertuang dalam seni pertunjukan.",
                      views: '189',
                      tanggal: '01-2-2026',
                      imagepath: 'assets/images/Budaya 2.webp',
                    ),
                    RecentNews(
                      kategori: 'SUARA',
                      judul: 'Kisah Keluarga Nomaden di Kawasan Wisata Medana',
                      author: 'Fathul Rakhman',
                      konten:
                          "Potret getir kehidupan Kerta dan keluarga yang hidup berpindah-pindah di tengah kemilau pembangunan kawasan pariwisata elit di Lombok Utara.",
                      views: '312',
                      tanggal: '01-2-2026',
                      imagepath: 'assets/images/SUARA 2.webp',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildCategoryBlock(
                'ALAM',
                "Geopark Rinjani Ajak Anak Muda Menelusuri Jejak Pangan Lokal di Lombok Utara",
                'assets/images/Alam.webp',
                'Redaksi Mayung Media',
              ),
              _buildCategoryBlock(
                'BERDAYA',
                "FT Hamzanwadi Sukses Gelar Informatics Robotic Innovation Cup 2026",
                'assets/images/IMG_1344.JPG',
                'Redaksi Mayung Media',
              ),
              _buildCategoryBlock(
                'BUDAYA',
                "Cupak Gerantang: Tradisi Sasak yang Tetap Eksis di Era Modern",
                'assets/images/Budaya 2.webp',
                'Redaksi Mayung Media',
              ),
              _buildCategoryBlock(
                'SUARA',
                "Potret Keluarga Nomaden: Tantangan di Tengah Kemajuan Wisata",
                'assets/images/SUARA 2.webp',
                'Fathul Rakhman',
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedNews() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) => setState(() => _currentPage = page),
            itemCount: _featuredData.length,
            itemBuilder: (context, index) =>
                _buildSlideItem(_featuredData[index]),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _featuredData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 25 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.white70,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideItem(Map<String, String> data) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          data['image']!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                color: data['kategori'] == 'ALAM'
                    ? Colors.green
                    : Colors.orange,
                child: Text(
                  data['kategori']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data['judul']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'judul',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Oleh Redaksi Mayung Media • ${data['date']}",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBlock(
    String category,
    String title,
    String img,
    String author,
  ) {
    return Container(
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
                category,
                style: const TextStyle(
                  fontSize: 21,
                  fontFamily: 'judul',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(namaKategori: category),
                  ),
                ),
                child: const Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1, color: Colors.white10),
          const SizedBox(height: 16),
          NewsItem(
            judul: title,
            kategori: category,
            konten:
                "Informasi mendalam mengenai perkembangan terbaru di sektor $category Nusa Tenggara Barat...",
            tanggal: '2026-02-05',
            author: author,
            Imagepath: img,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo_putih.webp', height: 80, width: 80),
          const SizedBox(height: 20),
          const Text(
            'Mayung Media adalah kanal berita di Nusa Tenggara Barat. Kami menyajikan informasi secara lebih mendalam.',
            style: TextStyle(
              fontFamily: 'primary',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Hubungi Kami',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'mayung.id@gmail.com',
            style: TextStyle(
              fontFamily: 'primary',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Media Sosial',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.tiktok,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
