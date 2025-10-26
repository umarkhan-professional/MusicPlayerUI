import 'package:flutter/material.dart';

void main() {
  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player UI',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // All songs (English/Instrumental + Telugu + Hindi) with local asset image paths
  final List<Map<String, String>> allSongs = [
    // 🎧 English / Instrumental (use default placeholder image)
    {
      'title': 'Lost in Echoes',
      'artist': 'Aurora Lights',
      'image': 'assets/images/lost_in_echoes.jpg',
    },
    {
      'title': 'Moonchild',
      'artist': 'Elysian Sky',
      'image': 'assets/images/Moonchild.jpg',
    },
    {
      'title': 'Midnight Groove',
      'artist': 'Nova Beats',
      'image': 'assets/images/Midnight_Groove.jpg',
    },
    {
      'title': 'Ocean Dreams',
      'artist': 'Blue Horizon',
      'image': 'assets/images/Ocean_Dreams.jpg',
    },
    {
      'title': 'Fading Memories',
      'artist': 'Velvet Tone',
      'image': 'assets/images/Fading_Memories.jpg',
    },
    {
      'title': 'Solar Waves',
      'artist': 'Cosmic Drift',
      'image': 'assets/images/Solar_Waves.jpg',
    },

    // 🎵 Telugu Songs (use specific images)
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

    // 🎶 Hindi Songs (use specific images)
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

  List<Map<String, String>> filteredSongs = [];
  Map<String, String>?
  currentlyPlaying; // hold song currently playing (for mini-player display)

  @override
  void initState() {
    super.initState();
    filteredSongs = List.from(allSongs);
    // initialize currently playing to first song for demo
    currentlyPlaying = allSongs.isNotEmpty ? allSongs[0] : null;
  }

  void filterSongs(String query) {
    setState(() {
      filteredSongs = allSongs
          .where(
            (song) =>
                song['title']!.toLowerCase().contains(query.toLowerCase()) ||
                song['artist']!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void playSong(Map<String, String> song) {
    setState(() {
      currentlyPlaying = song;
    });
    // TODO: integrate audio playback here
    // For now we just update the mini-player state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'My Music',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: filterSongs,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search songs, artists, albums...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),

            // 🎵 Song List
            Expanded(
              child: ListView.builder(
                itemCount: filteredSongs.length,
                itemBuilder: (context, index) {
                  final song = filteredSongs[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        song['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey.shade800,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.music_note,
                              color: Colors.white24,
                            ),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      song['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      song['artist']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(
                      Icons.more_vert,
                      color: Colors.white54,
                    ),
                    onTap: () => playSong(song),
                  );
                },
              ),
            ),

            // 🎧 Mini Player
            MiniPlayerWidget(
              song: currentlyPlaying,
              onPrevious: () {
                if (currentlyPlaying == null) return;
                final currentIndex = allSongs.indexOf(currentlyPlaying!);
                final prevIndex =
                    (currentIndex - 1 + allSongs.length) % allSongs.length;
                playSong(allSongs[prevIndex]);
              },
              onNext: () {
                if (currentlyPlaying == null) return;
                final currentIndex = allSongs.indexOf(currentlyPlaying!);
                final nextIndex = (currentIndex + 1) % allSongs.length;
                playSong(allSongs[nextIndex]);
              },
              onPlayPause: () {
                // toggle play/pause — for now just a placeholder
                // integrate audio_player package to actually play audio
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MiniPlayerWidget extends StatelessWidget {
  final Map<String, String>? song;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback? onPlayPause;

  const MiniPlayerWidget({
    super.key,
    this.song,
    this.onPrevious,
    this.onNext,
    this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = song != null
        ? song!['image']!
        : 'assets/images/default.jpg';
    final title = song != null ? song!['title']! : 'Currently Playing';
    final artist = song != null ? song!['artist']! : 'Artist Name';

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey.shade800,
                  alignment: Alignment.center,
                  child: const Icon(Icons.music_note, color: Colors.white24),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  artist,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(Icons.skip_previous, color: Colors.white),
          ),
          IconButton(
            onPressed: onPlayPause ?? () {},
            icon: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
          ),
          IconButton(
            onPressed: onNext,
            icon: const Icon(Icons.skip_next, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
