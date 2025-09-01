
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode:  ThemeMode.dark,
      home: Scaffold(
        bottomNavigationBar: BottomNavigation(),
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, size: 35),
          title: Text('Explore', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InstagramCard(),
              SizedBox(height: 20,),
              InstagramCard(),
            ],
          ),

        ),
      ), );
  }
}

class InstagramCard extends StatelessWidget {
  const InstagramCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        FirstRow(),  
        SizedBox(height: 8,),
        Publication(),
        ReactRow(),
        SizedBox(height: 3,),
        Description(),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
          child: Text('18 August', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w500, color: Colors.grey),),
        ),
      ],
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccUser(),
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

class AccUser extends StatelessWidget {
  const AccUser({
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
          child: CircleAvatar(backgroundImage: NetworkImage('https://instagram.falg6-2.fna.fbcdn.net/v/t51.2885-19/375701795_1413796569256173_3022531915367641140_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4zNDQuYzIifQ&_nc_ht=instagram.falg6-2.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QHaWdPXwRi4gzcbKX_DsynYEGb1rjF1jMG8cDaK3HleLdlgOxGbeRy8mPOUnkC8xEs&_nc_ohc=otnucwhosloQ7kNvwGHkBCc&_nc_gid=oUp2XiiVtxqm30slCLMqdA&edm=AA5fTDYBAAAA&ccb=7-5&oh=00_AfV8y30r7W4YlWKEgsJYIGDDP40-J4XbALY299H1wQXVBA&oe=68B8C07A&_nc_sid=7edfe2'), radius: 20,),
        ),
        SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('aacoding_tips', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ),),
            Text('Suggested for you', style: TextStyle(fontSize: 16,),),
          ],
        )
      ],
    );
  }
}

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


class Publication extends StatefulWidget {
  const Publication({super.key});

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 515 ,   
          child: PageView(
              controller: _controller,
              children: [
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu.webp',
                
                ),  
                Image.asset(  
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (1).webp',
                ),
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (2).webp',
                ),
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (3).webp',
                ),
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (4).webp',
                ),
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (5).webp',
                ),
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (6).webp',
                ),
                Image.asset(
                  'assets/Beautiful Vs Codes Themes....By @coding.leo..Follow for more @aacoding_tips ..Tags-#VSCode#Visu (7).webp',
                ),
              ],
            ),
        ),
        SizedBox(height: 16,),
        SmoothPageIndicator(
          controller: _controller,
          count: 8,
          effect:ScrollingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.indigo,
            dotHeight: 6,
            dotWidth: 6,
            spacing: 5),
        )
      ],
    );
   
  }
}

class ReactRow extends StatelessWidget {
  const ReactRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            SizedBox(width: 5,),
            CustomButton(icon: Icons.favorite_border_outlined, count: 1342),
            CustomButton(icon: Icons.comment_outlined, count: 256),
            CustomButton(icon: Icons.repeat, count: 213),
            CustomButton(icon: Icons.send_outlined, count: 232),
           
          ],
        ),
         SaveButton(),
      ],
    );
  }
}

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
            iLiked = false;
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
                padding: const EdgeInsets.all(20),
                child: Column(
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
                     Expanded(child: SingleChildScrollView(child: Column(
                       children: [
                         WriteComment(text: 'Hi', user: 'sirine'), 
                         SizedBox(height: 20,),
                         WriteComment(text: 'Wow Amazing!', user: 'john_xec'),
                       ],
                     ))),
                     
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

class Description extends StatefulWidget {
  const Description({super.key});

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
            SizedBox(width: 15,),
            Text('aacoding_tips', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18) ,),  
            Container(
              constraints: BoxConstraints( maxWidth: clickMore ? 250 : 200) ,
              child: Text('  Beautiful Vs Codes Themes ergvbldnfjeiefnehugurgbjbhuuwehuerwubgugqe9u3t0rgwhoeirhy8utuewqueugrbvsffofourghwroewueeffbjkfbhoqwryuirjsfbvasndoeihroewuefdhdshvdh', 
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

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem> [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: "Reels"),
      BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Post'),
      BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: NetworkImage('https://instagram.falg6-2.fna.fbcdn.net/v/t51.2885-19/375701795_1413796569256173_3022531915367641140_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4zNDQuYzIifQ&_nc_ht=instagram.falg6-2.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QHaWdPXwRi4gzcbKX_DsynYEGb1rjF1jMG8cDaK3HleLdlgOxGbeRy8mPOUnkC8xEs&_nc_ohc=otnucwhosloQ7kNvwGHkBCc&_nc_gid=oUp2XiiVtxqm30slCLMqdA&edm=AA5fTDYBAAAA&ccb=7-5&oh=00_AfV8y30r7W4YlWKEgsJYIGDDP40-J4XbALY299H1wQXVBA&oe=68B8C07A&_nc_sid=7edfe2'), radius: 16.5,),label: 'Profile'),
    ],
    currentIndex: currentIndex ,
    unselectedItemColor: Colors.white,
    selectedItemColor: const Color.fromARGB(59, 215, 213, 213),
    onTap: (index) {
      setState(() {
        currentIndex = index;
      });
    },) ;
  }
}