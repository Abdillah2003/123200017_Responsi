import 'package:flutter/material.dart';
import 'terbaru.dart';
import 'daerah.dart';
import 'internasional.dart';
import 'islam.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.network(
              'https://static.republika.co.id/files/images/logo.png',
              height: 150,
              width: 200,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaTerbaruPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Terbaru'),
                ),
                SizedBox(width: 16), // Jarak antara dua tombol dalam satu baris
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaDaerahPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Daerah'),
                ),
              ],
            ),
            SizedBox(height: 16), // Jarak antara dua baris tombol
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaInternasionalPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Internasional'),
                ),
                SizedBox(width: 16), // Jarak antara dua tombol dalam satu baris
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return BeritaIslamPage();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Mengubah warna tombol menjadi merah
                  ),
                  child: Text('Islam'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
