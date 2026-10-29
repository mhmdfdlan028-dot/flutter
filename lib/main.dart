
import 'package:flutter/material.dart';
import 'dtail_Chat.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          backgroundColor: const Color(0xFF075E54),
          foregroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chat'),
              Tab(icon: Icon(Icons.circle_outlined), text: 'Status'),
              Tab(icon: Icon(Icons.call), text: 'Call'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            halamanChat(),
            halamanStatus(),
            halamanCall(),
          ],
        ),
      ),
    );
  }

  Widget halamanChat() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chat',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          itemChat(
            nama: 'Duns',
            pesan: 'Hai bro, apa kabar?',
            warna: Colors.blue,
          ),

          itemChat(
            nama: 'Fadlan',
            pesan: 'Halo, apa kabar?',
            warna: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget itemChat({
    required String nama,
    required String pesan,
    required Color warna,
  }) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: warna,
          child: Text(
            nama.substring(0, 1),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(nama),
        subtitle: Text(pesan),
         onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChat(nama: nama),
            ),
          );
        },
      ),
    );
  }

  Widget halamanStatus() {
    return const Center(
      child: Text('Halaman Status'),
    );
  }

  Widget halamanCall() {
    return const Center(
      child: Text('Halaman Call'),
    );
  }
}
