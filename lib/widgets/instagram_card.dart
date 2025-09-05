import 'package:flutter/material.dart';
import 'package:insta/main.dart';
import 'package:insta/widgets/description.dart';
import 'package:insta/widgets/first_row.dart';


class InstagramCard extends StatelessWidget {
  final Post post;
  const InstagramCard({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        FirstRow(post: post),  
        SizedBox(height: 8,),
        // Publication(),
        Image.network(post.publication, height: 515, fit:BoxFit.cover,),
        ReactRow(post: post,),
        SizedBox(height: 3,),
        Description(username: post.username, description: post.description,),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
          child: Text('18 August', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w500, color: Colors.grey),),
        ),
      ],
    );
  }
}
