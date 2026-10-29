
import 'package:flutter/material.dart';

class DetailChat extends StatelessWidget {
  final String nama;

  const DetailChat({
    super.key,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xFF075E54),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                nama,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            tooltip: 'Video call',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur video call belum tersedia'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'Telepon',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur telepon belum tersedia'),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Menu lainnya',
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$value dipilih'),
                ),
              );
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'Info kontak',
                child: Text('Info kontak'),
              ),
              const PopupMenuItem<String>(
                value: 'Cari',
                child: Text('Cari'),
              ),
              const PopupMenuItem<String>(
                value: 'Pengaturan',
                child: Text('Pengaturan'),
              ),
            ],
          ),
        ],
      ),
      body: const SizedBox.expand(),
    );
  }
}
