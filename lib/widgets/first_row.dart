import 'package:flutter/material.dart';
import 'package:insta/main.dart';
import 'package:insta/widgets/acc_user.dart';
import 'package:insta/widgets/follow_button.dart';

class FirstRow extends StatelessWidget {
  final Post post;
  const FirstRow({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccUser(pfpUrl: post.profilePhoto, username: post.username),
        Row(
          children: [
            FollowButton(color: Color.fromARGB(255, 92, 96, 116)),
            Icon(Icons.more_vert, size: 27,),
            SizedBox(width: 7,),
          ],
        ),
      ],
    );
  }
}
