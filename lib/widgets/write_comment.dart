import 'package:flutter/material.dart';
import 'package:insta/widgets/heart_icon.dart';

class WriteComment extends StatelessWidget {
  final String text;
  final String user;
  const WriteComment({super.key, required this.text, required this.user});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: CircleAvatar(backgroundImage: NetworkImage('https://instagram.falg6-2.fna.fbcdn.net/v/t51.2885-19/375701795_1413796569256173_3022531915367641140_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4zNDQuYzIifQ&_nc_ht=instagram.falg6-2.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QHaWdPXwRi4gzcbKX_DsynYEGb1rjF1jMG8cDaK3HleLdlgOxGbeRy8mPOUnkC8xEs&_nc_ohc=otnucwhosloQ7kNvwGHkBCc&_nc_gid=oUp2XiiVtxqm30slCLMqdA&edm=AA5fTDYBAAAA&ccb=7-5&oh=00_AfV8y30r7W4YlWKEgsJYIGDDP40-J4XbALY299H1wQXVBA&oe=68B8C07A&_nc_sid=7edfe2'), radius: 20,),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(user, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16) ,),
                    Text('  3d', style: TextStyle(color: Colors.grey, fontSize: 16),)
                  ],
                ),
                Text(text, style: TextStyle( fontSize: 18),),
                Row(
                  children: [
                    Text('Reply',  style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey) ,),
                    SizedBox(width: 20,),
                    Text('See the translation', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey) ,),
                  ],
                ),
              ],
            ),
          ],
        ),
        HeartIcon(),
      ],
    );
  }
}


