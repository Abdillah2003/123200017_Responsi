import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BeritaIslamPage extends StatefulWidget {
  @override
  _BeritaIslamPageState createState() => _BeritaIslamPageState();
}

class _BeritaIslamPageState extends State<BeritaIslamPage> {
  List<dynamic> beritaList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = 'https://api-berita-indonesia.vercel.app/republika/islam';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        beritaList = data['data']['posts'];
      });
    }
  }

  void navigateToDetailBerita(dynamic berita) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBeritaPage(berita: berita),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Republika Islam'),
      ),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          var berita = beritaList[index];
          return ListTile(
            title: Text(berita['title']),
            leading: Image.network(berita['thumbnail']),
            onTap: () {
              navigateToDetailBerita(berita);
            },
          );
        },
      ),
    );
  }
}

class DetailBeritaPage extends StatelessWidget {
  final dynamic berita;

  const DetailBeritaPage({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              berita['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              berita['pubDate'],
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 16),
            Image.network(berita['thumbnail']),
            SizedBox(height: 16),
            Text(
              berita['description'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    berita['link'];
                  },
                  child: Text(
                    'Baca selengkapnya',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
