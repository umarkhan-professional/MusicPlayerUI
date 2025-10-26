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
  final List<Map<String, String>> allSongs = [
    // 🎧 English / Instrumental
    {'title': 'Lost in Echoes', 'artist': 'Aurora Lights'},
    {'title': 'Moonchild', 'artist': 'Elysian Sky'},
    {'title': 'Midnight Groove', 'artist': 'Nova Beats'},
    {'title': 'Ocean Dreams', 'artist': 'Blue Horizon'},
    {'title': 'Fading Memories', 'artist': 'Velvet Tone'},
    {'title': 'Solar Waves', 'artist': 'Cosmic Drift'},

    // 🎵 Telugu Songs
    {'title': 'Samajavaragamana', 'artist': 'Sid Sriram'},
    {'title': 'Butta Bomma', 'artist': 'Armaan Malik'},
    {'title': 'Ramuloo Ramulaa', 'artist': 'Anurag Kulkarni'},
    {'title': 'Dosti', 'artist': 'MM Keeravani'},
    {'title': 'Naatu Naatu', 'artist': 'Rahul Sipligunj & Kaala Bhairava'},
    {'title': 'Inkem Inkem Inkem Kaavaale', 'artist': 'Sid Sriram'},
    {'title': 'Vachindamma', 'artist': 'Sid Sriram'},

    // 🎶 Hindi Songs
    {'title': 'Tum Hi Ho', 'artist': 'Arijit Singh'},
    {'title': 'Kesariya', 'artist': 'Arijit Singh'},
    {'title': 'Tera Ban Jaunga', 'artist': 'Akhil Sachdeva & Tulsi Kumar'},
    {'title': 'Apna Bana Le', 'artist': 'Arijit Singh'},
    {'title': 'Raatan Lambiyan', 'artist': 'Jubin Nautiyal & Asees Kaur'},
    {'title': 'Bekhayali', 'artist': 'Sachet Tandon'},
    {'title': 'Kalank Title Track', 'artist': 'Arijit Singh'},
  ];

  List<Map<String, String>> filteredSongs = [];

  @override
  void initState() {
    super.initState();
    filteredSongs = List.from(allSongs);
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
                      child: Image.network(
                        'https://picsum.photos/seed/${song['title']}/60/60',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
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
                    onTap: () {
                      // TODO: Navigate to Now Playing Screen
                    },
                  );
                },
              ),
            ),

            // 🎧 Mini Player
            const MiniPlayerWidget(),
          ],
        ),
      ),
    );
  }
}

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              '[https://picsum.photos/seed/miniplayer/60/60](https://picsum.photos/seed/miniplayer/60/60)',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Currently Playing',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Artist Name',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_previous, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_next, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
