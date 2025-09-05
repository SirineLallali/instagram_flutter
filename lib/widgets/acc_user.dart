import 'package:flutter/material.dart';

class AccUser extends StatelessWidget {
  final String pfpUrl;
  final String username;
  const AccUser({
    required this.pfpUrl,
    required this.username,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 15,),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CircleAvatar(backgroundImage: NetworkImage(pfpUrl), radius: 20,),
        ),
        SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ),),
            Text('Suggested for you', style: TextStyle(fontSize: 16,),),
          ],
        )
      ],
    );
  }
}
