
import 'package:flutter/material.dart';

class DetailChat extends StatefulWidget {
  final String nama;

  const DetailChat({
    super.key,
    required this.nama,
  });

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> pesan = [
    {'teks': 'Hi!', 'saya': true},
    {
      'teks': 'Hi juga! Bagaimana belajar flutter ?',
      'saya': false,
    },
    {
      'teks': 'Mudah, cuman widget2 aja nih',
      'saya': true,
    },
    {
      'teks': 'Sudah paham berapa widget? Wkwkwk',
      'saya': false,
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void kirimPesan() {
    final teks = _controller.text.trim();
    if (teks.isEmpty) return;

    setState(() {
      pesan.add({'teks': teks, 'saya': true});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.black87,
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xFF493C91),
                size: 22,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(widget.nama)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Info kontak',
                child: Text('Info kontak'),
              ),
              const PopupMenuItem(
                value: 'Pengaturan',
                child: Text('Pengaturan'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: pesan.length,
              itemBuilder: (context, index) {
                final item = pesan[index];
                final saya = item['saya'] as bool;

                return Align(
                  alignment: saya
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(
                      maxWidth:
                          MediaQuery.of(context).size.width * 0.78,
                    ),
                    decoration: BoxDecoration(
                      color: saya
                          ? const Color(0xFFC8E6C9)
                          : const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      item['teks'] as String,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: const Color(0xFFFFF7FF),
            padding: const EdgeInsets.fromLTRB(6, 4, 6, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => kirimPesan(),
                    decoration: const InputDecoration(
                      hintText: 'Tulis pesan...',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.black54,
                  ),
                  onPressed: kirimPesan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
