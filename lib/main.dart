import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebLayout(),
    );
  }
}

class WebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: screenWidth < 600
          ? AppBar(
              title: Text('Biodata Mahasiswa'),
              backgroundColor: Colors.blue[700],
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            )
          : null,
      drawer: screenWidth < 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue[800]),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profil'),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Kemampuan'),
                    onTap: () {
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          // Sidebar di layar besar
          if (screenWidth >= 600)
            Container(
              width: 200,
              color: Colors.blue[800],
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text('Profil', style: TextStyle(color: Colors.white)),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.white),
                    title: Text('Kemampuan', style: TextStyle(color: Colors.white)),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),

          // Area Konten Utama
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto Profil
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Informasi Biodata
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Nama: Ni Wayan Ariningsih',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text('NIM: 42230060'),
                        const SizedBox(height: 5),
                        Text('Prodi: Teknologi Informasi'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Deskripsi Diri
                  Text(
                    'DESKRIPSI :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Saya adalah mahasiswa aktif di UNDIKNAS, Prodi saya adalah Teknologi Informasi. 2022 adalah awal saya kuliah dan mengenal UNDIKNAS',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Kemampuan
                  Text(
                    'KEMAMPUAN :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.blue[700]),
                        title: Text('Saya mampu memahami apa yang di jelaskan oleh dosen.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.blue[700]),
                        title: Text('Saya mampu belajar secara individu maupun kelompok'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.blue[700]),
                        title: Text('Saya mampu berbaur dengan teman-teman di organisasi'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
