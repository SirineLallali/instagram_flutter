import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Color color ;
  const FollowButton({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, style: TextButton.styleFrom(
      backgroundColor: color ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18 )),
          
      
    child: Text('Follow', style: TextStyle(color: Colors.white, fontSize: 18),));
  }
}
