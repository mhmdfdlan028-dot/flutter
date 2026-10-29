
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
  final TextEditingController pesanController =
      TextEditingController();

  final List<String> daftarPesan = [
    'Hi!',
    'Hi juga! Bagaimana belajar flutter?',
    'Mudah, cuman widget aja nih',
    'Sudah paham berapa widget? Wkwkwk',
  ];

  void kirimPesan() {
    final pesan = pesanController.text.trim();

    if (pesan.isEmpty) return;

    setState(() {
      daftarPesan.add(pesan);
      pesanController.clear();
    });
  }

  @override
  void dispose() {
    pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),

      // Bagian atas chat
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.black87,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              widget.nama,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),

      // Bagian isi chat dan input teks
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: daftarPesan.length,
              itemBuilder: (context, index) {
                final pesan = daftarPesan[index];
                final pesanSaya = index.isEven;

                return Align(
                  alignment: pesanSaya
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(
                      maxWidth:
                          MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: pesanSaya
                          ? const Color(0xFFC8E6C9)
                          : const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      pesan,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                );
              },
            ),
          ),

          // Kolom input pesan
          Container(
            color: const Color(0xFFFFF7FF),
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesanController,
                    onSubmitted: (_) => kirimPesan(),
                    decoration: const InputDecoration(
                      hintText: 'Tulis pesan...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: kirimPesan,
                  icon: const Icon(
                    Icons.send,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
