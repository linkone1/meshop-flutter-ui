import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      title: '3C3',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFffffff),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFFffffff),
          indicatorColor: const Color(0xFFffffff),
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFF000000)),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Hi, Linus',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/images/hello-hand.svg',
                      width: 36,
                      height: 36,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/avatar2.svg',
                      width: 36,
                      height: 36,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore the World!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 8),
            // Search bar with divider and icon
            Row(
              children: [
                // Search bar
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Divider
                Container(
                  height: 48,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 8),
                // Filter icon
                IconButton(
                  icon: const Icon(
                    Icons.tune,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  _buildPictureCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Badge(
              backgroundColor: Colors.blueAccent,
              smallSize: 8,
              child: Icon(Icons.home_filled),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Badge(
              backgroundColor: Colors.grey,
              smallSize: 8,
              child: Icon(Icons.watch_later_outlined),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Badge(
              backgroundColor: Colors.grey,
              smallSize: 8,
              child: Icon(Icons.favorite_border_outlined),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Badge(
              backgroundColor: Colors.grey,
              smallSize: 8,
              child: Icon(Icons.person_2_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  // Picture card method (unchanged)
  Widget _buildPictureCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/mountains.svg',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'See top-rated locations.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Take your journey to the next level.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}