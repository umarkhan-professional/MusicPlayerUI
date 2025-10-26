import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎧 Full Playlist Data (English + Telugu + Hindi)
    final List<Map<String, String>> playlist = [
      // English / Instrumental
      {
        'title': 'Lost in Echoes',
        'artist': 'Aurora Lights',
        'image': 'assets/images/lost_in_echoes.jpg',
      },
      {
        'title': 'Moonchild',
        'artist': 'Elysian Sky',
        'image': 'assets/images/moonchild.jpg',
      },
      {
        'title': 'Midnight Groove',
        'artist': 'Nova Beats',
        'image': 'assets/images/midnight_groove.jpg',
      },
      {
        'title': 'Ocean Dreams',
        'artist': 'Blue Horizon',
        'image': 'assets/images/ocean_dreams.jpg',
      },
      {
        'title': 'Fading Memories',
        'artist': 'Velvet Tone',
        'image': 'assets/images/fading_memories.jpg',
      },
      {
        'title': 'Solar Waves',
        'artist': 'Cosmic Drift',
        'image': 'assets/images/solar_waves.jpg',
      },

      // Telugu Songs
      {
        'title': 'Samajavaragamana',
        'artist': 'Sid Sriram',
        'image': 'assets/images/samajavaragamana.jpg',
      },
      {
        'title': 'Butta Bomma',
        'artist': 'Armaan Malik',
        'image': 'assets/images/butta_bomma.jpg',
      },
      {
        'title': 'Ramuloo Ramulaa',
        'artist': 'Anurag Kulkarni',
        'image': 'assets/images/ramuloo_ramulaa.jpg',
      },
      {
        'title': 'Dosti',
        'artist': 'MM Keeravani',
        'image': 'assets/images/dosti.jpg',
      },
      {
        'title': 'Naatu Naatu',
        'artist': 'Rahul Sipligunj & Kaala Bhairava',
        'image': 'assets/images/naatu_naatu.jpg',
      },
      {
        'title': 'Inkem Inkem Inkem Kaavaale',
        'artist': 'Sid Sriram',
        'image': 'assets/images/inkem_inkem.jpg',
      },
      {
        'title': 'Vachindamma',
        'artist': 'Sid Sriram',
        'image': 'assets/images/vachindamma.jpg',
      },

      // Hindi Songs
      {
        'title': 'Tum Hi Ho',
        'artist': 'Arijit Singh',
        'image': 'assets/images/tum_hi_ho.jpg',
      },
      {
        'title': 'Kesariya',
        'artist': 'Arijit Singh',
        'image': 'assets/images/kesariya.jpg',
      },
      {
        'title': 'Tera Ban Jaunga',
        'artist': 'Akhil Sachdeva & Tulsi Kumar',
        'image': 'assets/images/tera_ban_jaunga.jpg',
      },
      {
        'title': 'Apna Bana Le',
        'artist': 'Arijit Singh',
        'image': 'assets/images/apna_bana_le.jpg',
      },
      {
        'title': 'Raatan Lambiyan',
        'artist': 'Jubin Nautiyal & Asees Kaur',
        'image': 'assets/images/raatan_lambiyan.jpg',
      },
      {
        'title': 'Bekhayali',
        'artist': 'Sachet Tandon',
        'image': 'assets/images/bekhayali.jpg',
      },
      {
        'title': 'Kalank Title Track',
        'artist': 'Arijit Singh',
        'image': 'assets/images/kalank_title_track.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2),
        title: const Text(
          'Playlist / Queue',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          final song = playlist[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  song['image']!,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                song['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                song['artist']!,
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(Icons.drag_handle, color: Colors.white38),
              onTap: () {
                // TODO: Navigate to Now Playing Screen later
              },
            ),
          );
        },
      ),
    );
  }
}
