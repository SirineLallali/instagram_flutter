import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem> [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: "Reels"),
      BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Post'),
      BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/14101776?s=200&v=4'), radius: 16.5,),label: 'Profile'),
    ],
    currentIndex: currentIndex ,
    unselectedItemColor: Colors.white,
    selectedItemColor: const Color.fromARGB(59, 215, 213, 213),
    onTap: (index) {
      setState(() {
        currentIndex = index;
      });
    },) ;
  }
}
