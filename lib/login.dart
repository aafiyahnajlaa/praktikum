import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function login;
  final List<Map<String, String>> dataKelompok;

  LoginPage({
    required this.usernameController,
    required this.passwordController,
    required this.login,
    required this.dataKelompok,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // Menggunakan Column untuk menyusun widget secara vertikal
        children: [
          SizedBox(height: 20), // Menambahkan ruang kosong di atas
          const Icon(
            Icons.calculate,
            size: 200.0,
          ),
          // Image.asset(
          //   'images/kalkulator.png', // Menampilkan gambar dari asset
          //   width: 200.0, // Lebar gambar
          //   height: 200.0, // Tinggi gambar
          // ),
          // SizedBox(height: 10), // Menambahkan ruang kosong setelah gambar
          SizedBox(height: 20), // Gap setelah tabel (ruang kosong)
          const SizedBox(height: 10),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(usernameController, 'Username', Icons.person),
                  SizedBox(height: 10),
                  _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (usernameController.text == 'admin' && passwordController.text == '1234') {
                        login();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Username atau password salah')),
                        );
                      }
                    },
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Colors.blueGrey[900],
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      _showForgotPasswordDialog(context);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 400),
        ],
      ),
    );
  }

  // Widget untuk membangun TextField
  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon, color: Colors.black),
        labelStyle: TextStyle(color: Colors.black),
      ),
      obscureText: obscureText,
    );
  }

  // Dialog untuk reset password
  void _showForgotPasswordDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Masukkan email Anda untuk reset password:'),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Logika untuk mengirim email reset password
                // Misalnya, panggil API atau tampilkan pesan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Email reset password telah dikirim')),
                );
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Kirim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }
}