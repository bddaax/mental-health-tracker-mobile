import 'package:flutter/material.dart';
import 'package:mental_health_tracker/screens/moodentry_form.dart'; // Import halaman form

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );

          // Menambahkan navigasi ke halaman lain berdasarkan tombol yang ditekan
          if (item.name == "Tambah Mood") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoodEntryFormPage(),
              ),
            );
          } else if (item.name == "Lihat Mood") {
            // Tambahkan navigasi ke halaman "Lihat Mood" jika diperlukan
          } else if (item.name == "Logout") {
            // Tambahkan aksi logout atau navigasi ke halaman login
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
