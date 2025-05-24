import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 159, 214, 142), Color.fromARGB(255, 83, 240, 224)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              filled: true,
              fillColor: Colors.white.withAlpha((0.8 * 255).toInt()),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        leading: IconButton(
            icon: Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.4 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
          onPressed: () {
            // Handle scan action
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with your asset
              radius: 16,
            ),
            onPressed: () {
              // Handle avatar action
            },
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 72, 112, 145),
        child: const Center(
          child: Text('Hello, World appbar! This is my app bar!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to perform when the button is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Floating Action Button Pressed!'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}