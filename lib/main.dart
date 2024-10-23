import 'package:flutter/material.dart';
import 'api_service.dart';
import 'surah.dart';
import 'detail_page.dart'; // Tambahkan import ini

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SurahListScreen(),
    );
  }
}

class SurahListScreen extends StatefulWidget {
  @override
  _SurahListScreenState createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  late Future<List<Surah>> futureSurahs;
  List<Surah> filteredSurahs = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    futureSurahs = ApiService().fetchSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Surah'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari Surah...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Surah>>(
        future: futureSurahs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data'));
          }

          final surahs = snapshot.data!;
          filteredSurahs = surahs.where((surah) {
            return surah.name.toLowerCase().contains(query.toLowerCase()) ||
                   surah.translation.toLowerCase().contains(query.toLowerCase());
          }).toList();

          return ListView.builder(
            itemCount: filteredSurahs.length,
            itemBuilder: (context, index) {
              final surah = filteredSurahs[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    surah.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${surah.translation} - ${surah.numberOfAyahs} Ayat\n${surah.revelation}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.blue),
                    onPressed: () {
                      // Implement audio play functionality if needed
                    },
                  ),
                  onTap: () {
                    // Navigasi ke halaman detail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(surah: surah),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
