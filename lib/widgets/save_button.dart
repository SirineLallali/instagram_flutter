import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({
    super.key,
  });

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  IconData icon= Icons.bookmark_border;
  bool iLiked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
        setState(() {
            if (iLiked) {
              icon = Icons.bookmark_border_outlined;
            }
            else{
              icon = Icons.bookmark_outlined;
            }
            iLiked = !iLiked;
          });
    } ,icon :Icon(icon), iconSize: 30,);
  }
}
