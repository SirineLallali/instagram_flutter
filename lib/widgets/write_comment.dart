import 'package:flutter/material.dart';
import 'package:insta/main.dart';
import 'package:insta/widgets/heart_icon.dart';

class WriteComment extends StatelessWidget {
  final Comment comment;
  const WriteComment({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: CircleAvatar(backgroundImage: NetworkImage(comment.pfpUrl), radius: 20,),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 250),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(text:comment.username, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16)),
                      TextSpan(text: '  3d', style: TextStyle(color: Colors.grey, fontSize: 16),)
                    ],
                      
                    ),
                  ),
                ),
                Container(constraints: BoxConstraints(maxWidth: 250),child: Text(comment.text, style: TextStyle( fontSize: 18),)),
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


