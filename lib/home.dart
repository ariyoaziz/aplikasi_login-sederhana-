import 'package:flutter/material.dart'; // Mengimpor paket material Flutter untuk UI

class HomeScreen extends StatefulWidget {
  final String name; // Variabel untuk menyimpan nama pengguna

  const HomeScreen(
      {super.key,
      required this.name}); // Konstruktor untuk HomeScreen, menerima nama pengguna

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState(); // Membuat state untuk HomeScreen
}

class _HomeScreenState extends State<HomeScreen> {
  // Page controller untuk PageView
  final PageController _pageController =
      PageController(); // Controller untuk mengelola PageView
  int _currentPage = 0; // Variabel untuk menyimpan halaman saat ini

  // Fungsi untuk memperbarui halaman saat ini
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index; // Mengupdate _currentPage dengan index halaman baru
    });
  }

  // Fungsi untuk mendapatkan pesan sapaan berdasarkan waktu saat ini
  String getGreetingMessage() {
    final hour = DateTime.now().hour; // Mendapatkan jam saat ini

    if (hour >= 5 && hour < 12) {
      return 'Selamat Pagi'; // Jika jam antara 5 hingga 12
    } else if (hour >= 12 && hour < 15) {
      return 'Selamat Siang'; // Jika jam antara 12 hingga 15
    } else if (hour >= 15 && hour < 18) {
      return 'Selamat Sore'; // Jika jam antara 15 hingga 18
    } else {
      return 'Selamat Malam'; // Jika jam lebih dari 18
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengatur latar belakang menjadi putih
      body: SafeArea(
        // Menghindari area di sekitar layar
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding untuk seluruh konten
          child: SingleChildScrollView(
            // Membuat konten bisa di-scroll
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Menyusun konten ke kiri
              children: [
                // Ikon profil dan pesan selamat datang
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Mengatur anak di antara
                  children: [
                    // Pesan selamat datang
                    Expanded(
                      child: Text(
                        "Hello, ${widget.name}.", // Menampilkan nama pengguna
                        style: const TextStyle(
                          fontSize: 20, // Ukuran font
                          fontWeight: FontWeight.bold, // Ketebalan font
                          color: Colors.black87, // Warna font
                        ),
                      ),
                    ),
                    // Ikon profil
                    GestureDetector(
                      onTap: () {
                        // Tindakan ketika gambar profil diklik
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/profile.jpg', // Gambar profil
                          width: 50, // Lebar gambar
                          height: 50, // Tinggi gambar
                          fit: BoxFit.cover, // Memastikan gambar memenuhi oval
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Jarak vertikal
                // Pesan sapaan berdasarkan waktu
                Text(
                  getGreetingMessage(), // Mengambil pesan sapaan
                  style: const TextStyle(
                    fontSize: 16, // Ukuran font
                    fontWeight: FontWeight.w600, // Ketebalan font
                  ),
                ),
                const SizedBox(height: 20), // Jarak vertikal
                // Bagian gambar utama
                Center(
                  child: Column(
                    children: [
                      // PageView untuk gambar
                      SizedBox(
                        height: 150, // Tinggi untuk PageView
                        child: PageView(
                          controller: _pageController, // Mengaitkan controller
                          onPageChanged:
                              _onPageChanged, // Memanggil fungsi ketika halaman berubah
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(15), // Sudut membulat
                              child: Image.asset(
                                'assets/img/bener2.jpg', // Gambar pertama
                                fit: BoxFit
                                    .cover, // Memastikan gambar memenuhi area
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(15), // Sudut membulat
                              child: Image.asset(
                                'assets/img/bener1.jpg', // Gambar kedua
                                fit: BoxFit
                                    .cover, // Memastikan gambar memenuhi area
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(15), // Sudut membulat
                              child: Image.asset(
                                'assets/img/bener3.jpg', // Gambar ketiga
                                fit: BoxFit
                                    .cover, // Memastikan gambar memenuhi area
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10), // Jarak vertikal
                      // Indikator titik
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Menyusun titik di tengah
                        children: List.generate(3, (index) {
                          // Menghasilkan 3 titik
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4), // Margin horizontal
                            width: 8, // Lebar titik
                            height: 8, // Tinggi titik
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // Bentuk titik bulat
                              color: _currentPage ==
                                      index // Mengubah warna titik berdasarkan halaman saat ini
                                  ? Colors.black // Jika ini halaman saat ini
                                  : Colors
                                      .black54, // Jika bukan halaman saat ini
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40), // Jarak vertikal
                // Judul bagian
                const Text(
                  "Daftar Menu Hari ini,", // Teks judul
                  style: TextStyle(
                    fontSize: 18, // Ukuran font
                    fontWeight: FontWeight.w800, // Ketebalan font
                    color: Colors.black54, // Warna font
                  ),
                ),
                const SizedBox(height: 20), // Jarak vertikal
                // Grid view untuk item makanan
                GridView.count(
                  crossAxisCount: 2, // Jumlah kolom dalam grid
                  shrinkWrap: true, // Mengatur ukuran grid
                  physics:
                      const NeverScrollableScrollPhysics(), // Nonaktifkan scroll untuk grid
                  crossAxisSpacing: 20, // Spacing antar kolom
                  mainAxisSpacing: 20, // Spacing antar baris
                  childAspectRatio: 0.75, // Rasio aspek untuk item grid
                  children: [
                    buildFoodCard(
                      'Mie Goreng', // Judul makanan
                      'Rp23.000', // Harga makanan
                      'assets/img/makanan3.jpg', // Gambar mie
                    ),
                    buildFoodCard(
                      'Ayam Goreng', // Judul makanan
                      'Rp15.000', // Harga makanan
                      'assets/img/makanan1.jpg', // Gambar ayam goreng
                    ),
                    buildFoodCard(
                      'Nasi Goreng', // Judul makanan
                      'Rp11.000', // Harga makanan
                      'assets/img/makanan2.jpg', // Gambar nasi goreng
                    ),
                    buildFoodCard(
                      'Ayam Bakar', // Judul makanan
                      'Rp35.000', // Harga makanan
                      'assets/img/makanan4.jpg', // Gambar ayam bakar
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Jarak vertikal
                // Tombol untuk log out
                Center(
                  child: SizedBox(
                    width: double.infinity, // Lebar penuh
                    height: 50, // Tinggi tombol
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blueAccent, // Warna latar belakang tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Sudut membulat pada tombol
                        ),
                      ),
                      onPressed: () {
                        // Navigasi untuk kembali ke halaman login
                        Navigator.pop(context); // Kembali ke halaman sebelumnya
                      },
                      child: const Text(
                        'Log Out', // Teks tombol
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white), // Ukuran dan warna teks
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu makanan
  Widget buildFoodCard(String title, String price, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang putih
        borderRadius: BorderRadius.circular(15), // Sudut membulat
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // Warna bayangan
            blurRadius: 8, // Seberapa buram bayangan
            offset: Offset(0, 3), // Posisi bayangan
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(8.0), // Padding untuk konten di dalam kartu
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Menyusun konten secara vertikal
          children: [
            // Gambar makanan
            Expanded(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(12), // Sudut membulat pada gambar
                child: Image.asset(
                  imagePath, // Path gambar makanan
                  fit: BoxFit.cover, // Memastikan gambar memenuhi area
                ),
              ),
            ),
            const SizedBox(height: 10), // Jarak vertikal
            // Judul makanan
            Text(
              title, // Teks judul makanan
              style: const TextStyle(
                fontSize: 18, // Ukuran font
                fontWeight: FontWeight.bold, // Ketebalan font
                color: Colors.black87, // Warna font
              ),
              textAlign: TextAlign.center, // Menyusun teks di tengah
            ),
            const SizedBox(height: 5), // Jarak vertikal
            // Harga makanan
            Text(
              price, // Teks harga makanan
              style: const TextStyle(
                fontSize: 16, // Ukuran font
                color: Colors.black87, // Warna font
              ),
              textAlign: TextAlign.center, // Menyusun teks di tengah
            ),
            const SizedBox(height: 10), // Jarak vertikal
            // Tombol beli
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green, // Warna latar belakang tombol beli
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Sudut membulat pada tombol
                ),
              ),
              onPressed: () {
                // Tindakan ketika tombol beli diklik
              },
              child: const Text(
                'Beli', // Teks tombol
                style: TextStyle(
                    fontSize: 16, // Ukuran font
                    fontWeight: FontWeight.w500, // Ketebalan font
                    color: Colors.white), // Warna font
              ),
            ),
          ],
        ),
      ),
    );
  }
}
