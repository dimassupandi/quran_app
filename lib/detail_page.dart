import 'package:flutter/material.dart';
import 'surah.dart';

class DetailPage extends StatelessWidget {
  final Surah surah;

  DetailPage({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul dan informasi dasar
            Text(
              surah.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '(${surah.translation})',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),

            // Deskripsi
            Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              surah.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Divider(),

            // Informasi tambahan
            Text(
              'Informasi:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Jumlah Ayat: ${surah.numberOfAyahs}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Revelasi: ${surah.revelation}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Divider(),

            // Audio
            Text(
              'Audio:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              surah.audio,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 20),

            // Tombol untuk memutar audio (dummy action)
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement audio play functionality if needed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Memutar audio...')),
                  );
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Putar Audio'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
