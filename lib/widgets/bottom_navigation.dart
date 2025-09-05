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
      BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: NetworkImage('https://instagram.falg6-2.fna.fbcdn.net/v/t51.2885-19/375701795_1413796569256173_3022531915367641140_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4zNDQuYzIifQ&_nc_ht=instagram.falg6-2.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QFK5wjInvHsEUC8hqsHzFEvddC84_YamMVtv60-x3SVxQIMKmorNg6s78dytEvDKfk&_nc_ohc=YBdj_-edt5IQ7kNvwGRvNaj&_nc_gid=G1y7yIcIbX_w1qsa8RWsQQ&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AfbjSOcTvH-Vp5Rczf0f0gv-jV3njN7KJk1HtaSdZS2edw&oe=68BEAF3A&_nc_sid=7a9f4b'), radius: 16.5,),label: 'Profile'),
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
