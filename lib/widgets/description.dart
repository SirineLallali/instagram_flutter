import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String username;
  final String description;
  const Description({super.key, required this.username, required this.description});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool clickMore= false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: clickMore ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 14,),
            Text(widget.username, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18) ,),  
            SizedBox(width: 5 ,),
            Container(
              constraints: BoxConstraints( maxWidth: clickMore ? 250 : 200) ,
              child: Text(widget.description, 
              style: TextStyle(fontSize: 17 ),
              overflow: clickMore ? TextOverflow.visible : TextOverflow.ellipsis,)),
          ],
        ), 
        GestureDetector(onTap:() {
              setState(() {
                clickMore = !clickMore;
              });
            } ,child: Text(clickMore ? 'less' : 'more', style: TextStyle( color: Colors.grey , fontWeight: FontWeight.w600)),),
      ],
    );
  }
}