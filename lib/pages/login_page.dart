import 'package:flutter/material.dart'; // Mengimpor paket material Flutter untuk UI
import 'package:aplikasi_login/home.dart'; // Mengimpor halaman HomeScreen
import 'package:flutter_svg/flutter_svg.dart'; // Mengimpor paket untuk menggunakan gambar SVG

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // Konstruktor untuk LoginScreen

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState(); // Membuat state untuk LoginScreen
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController =
      TextEditingController(); // Controller untuk mengelola input username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengatur latar belakang menjadi putih
      body: SafeArea(
        // Menghindari area di sekitar layar
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0), // Padding horizontal untuk konten
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Menyusun konten di tengah vertikal
            children: [
              // Gambar di atas
              Image.asset(
                'assets/img/login.png', // Gambar login
                height: 200, // Tinggi gambar
              ),
              const SizedBox(height: 40), // Jarak vertikal
              // Title "Login"
              const Text(
                'Login', // Teks judul
                style: TextStyle(
                  fontSize: 28, // Ukuran font
                  fontWeight: FontWeight.bold, // Ketebalan font
                  color: Colors.black87, // Warna font
                ),
              ),
              const SizedBox(height: 30), // Jarak vertikal
              // Input Username
              TextField(
                controller: _nameController, // Mengaitkan controller
                decoration: InputDecoration(
                  labelText: 'Username', // Label untuk input
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Sudut membulat pada border
                  ),
                  prefixIcon: const Icon(
                      Icons.person_2_outlined), // Ikon di depan input
                ),
              ),
              const SizedBox(height: 20), // Jarak vertikal
              // Input Password
              TextField(
                obscureText: true, // Menyembunyikan teks untuk password
                decoration: InputDecoration(
                  labelText: 'Password', // Label untuk input
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Sudut membulat pada border
                  ),
                  prefixIcon:
                      const Icon(Icons.lock_outline), // Ikon di depan input
                ),
              ),
              const SizedBox(height: 10), // Jarak vertikal
              // Forgot Password
              Align(
                alignment:
                    Alignment.centerRight, // Mengatur posisi tombol ke kanan
                child: TextButton(
                  onPressed: () {
                    // Tindakan ketika tombol 'Forgot Password' ditekan
                  },
                  child: const Text(
                    'Forgot Password?', // Teks tombol
                    style: TextStyle(color: Colors.blue), // Warna teks
                  ),
                ),
              ),
              const SizedBox(height: 20), // Jarak vertikal
              // Tombol Login
              SizedBox(
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
                    if (_nameController.text.isNotEmpty) {
                      // Cek apakah username tidak kosong
                      // Navigasi ke halaman home
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              name: _nameController
                                  .text), // Mengirimkan nama pengguna ke HomeScreen
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login', // Teks tombol
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white), // Ukuran dan warna teks
                  ),
                ),
              ),
              const SizedBox(height: 20), // Jarak vertikal
              // Login with other options
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Menyusun anak di tengah
                children: [
                  IconButton(
                    onPressed: () {
                      // Tindakan ketika tombol Google ditekan
                    },
                    icon: SvgPicture.asset(
                      'assets/icon/google.svg', // Gambar ikon Google
                      width: 28, // Lebar ikon
                      height: 28, // Tinggi ikon
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Tindakan ketika tombol Facebook ditekan
                    },
                    icon: SvgPicture.asset(
                      'assets/icon/facebook.svg', // Gambar ikon Facebook
                      width: 28, // Lebar ikon
                      height: 28, // Tinggi ikon
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Tindakan ketika tombol Apple ditekan
                    },
                    icon: SvgPicture.asset(
                      'assets/icon/apple.svg', // Gambar ikon Apple
                      width: 28, // Lebar ikon
                      height: 28, // Tinggi ikon
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Jarak vertikal
              // Register text
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Menyusun anak di tengah
                children: [
                  const Text(
                      "Don't have an account yet?"), // Teks untuk menanyakan pendaftaran
                  TextButton(
                    onPressed: () {
                      // Tindakan ketika tombol 'Register' ditekan
                    },
                    child: const Text('Register'), // Teks tombol pendaftaran
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
