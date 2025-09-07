import 'package:flutter/material.dart';
import 'package:insta/widgets/write_comment.dart';
import 'package:insta/main.dart';

class CustomButton extends StatefulWidget { 
  final IconData icon;
  final int count;
  const CustomButton({super.key, required this.icon, required this.count});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}
class _CustomButtonState extends State<CustomButton> {
  late int currentCount;
  bool iLiked= false;
  late IconData currentIcon;
  @override
  void initState() {
    super.initState();
    currentCount = widget.count; 
    currentIcon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () { 
          if (widget.icon == Icons.comment_outlined){
           showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 52, 52, 52),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.95, // Set your desired height
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column( //listview
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Comments', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 23),),
                    SizedBox(height: 20,),
                     Expanded(child: FutureBuilder(
                       future: fetchComments(),
                       builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                        }
                       else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                       }
                       else{
                        final comments = snapshot.data ?? [];
                         return ListView.separated(
                         separatorBuilder: (context, index) => SizedBox(height: 20,),
                         itemBuilder: (context, index) {
                         final comment = comments [index];
                         return WriteComment(comment: comment);
                         },
                         itemCount: comments.length,
                         );
                       }
                       }
                     )),
                  ],
                ),
              )
            );
          },
        );
          }
          else if (widget.icon == Icons.favorite_border_outlined) {
             setState(() {
            if (iLiked) {
              currentCount--;
              currentIcon = Icons.favorite_border_outlined;
            }
            else{
              currentCount++;
              currentIcon = Icons.favorite_outlined;
            }
            iLiked = !iLiked;
          });
          }
        }, icon: Icon(currentIcon, size: 30, color: iLiked ? Colors.red : Colors.grey) ),
        Text(currentCount.toString(), style: TextStyle( fontSize: 18),)
      ],
    );

  }
}
