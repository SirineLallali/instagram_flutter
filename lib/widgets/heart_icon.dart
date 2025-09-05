import 'package:flutter/material.dart';


class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool iLiked = false;
  int count = 234;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){
          setState(() {
            if (iLiked) {
              count--;
            }
            else{
              count++;
            }
            iLiked = !iLiked;
          });
        }, icon: Icon( iLiked ? Icons.favorite : Icons.favorite_border_outlined, color: iLiked ? Colors.red : Colors.grey, size: 20,)),
        Text('$count'),
      ],
    );
  }
}
