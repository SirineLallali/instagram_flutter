
import 'package:flutter/material.dart';
import 'package:insta/widgets/bottom_navigation.dart';
import 'package:insta/widgets/custom_button.dart';
import 'package:insta/widgets/instagram_card.dart';
import 'package:insta/widgets/save_button.dart';

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
        body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
        itemBuilder: (context, index) {
          final post =posts[index];
          return InstagramCard(post: post);
        },
        itemCount: posts.length,
        )
      ), );
  }
}

class ReactRow extends StatelessWidget {
  final Post post;
  const ReactRow({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 5,),
            CustomButton(icon: Icons.favorite_border_outlined, count: post.likesCount),
            CustomButton(icon: Icons.comment_outlined, count: post.commentsCount),
            CustomButton(icon: Icons.repeat, count: post.repostCount),
            CustomButton(icon: Icons.send_outlined, count: post.shareCount),
           
          ],
        ),
         SaveButton(),
      ],
    );
  }
}

class Post {
  final String username;
  final String profilePhoto;
  final String publication;
  final int likesCount;
  final int commentsCount;
  final int repostCount;
  final int shareCount;
  final String description;

  Post ({
    required this.username,
    required this.profilePhoto,
    required this.publication,
    required this.likesCount,
    required this.commentsCount,
    required this.repostCount,
    required this.shareCount,
    required this.description,
  });
}

final List<Post> posts = [
  Post(
        username: 'aacoding_tips', 
        profilePhoto: 'https://instagram.falg6-2.fna.fbcdn.net/v/t51.2885-19/375701795_1413796569256173_3022531915367641140_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4zNDQuYzIifQ&_nc_ht=instagram.falg6-2.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2QFK5wjInvHsEUC8hqsHzFEvddC84_YamMVtv60-x3SVxQIMKmorNg6s78dytEvDKfk&_nc_ohc=YBdj_-edt5IQ7kNvwGRvNaj&_nc_gid=G1y7yIcIbX_w1qsa8RWsQQ&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AfbjSOcTvH-Vp5Rczf0f0gv-jV3njN7KJk1HtaSdZS2edw&oe=68BEAF3A&_nc_sid=7a9f4b', 
        publication: 'https://cms-assets.themuse.com/media/lead/01212022-1047259374-coding-classes_scanrail.jpg', 
        likesCount: 1321, 
        commentsCount: 123, 
        repostCount: 232, 
        shareCount: 328, 
        description: 'Beautiful Vs Codes Themes ergvbldnfjeiefnehugurgbjbhuuwehuerwubgugqe9u3t0rgwhoeirhy8utuewqueugrbvsffofourghwroewueeffbjkfbhoqwryuirjsfbvasndoeihroewuefdhdshvdh'
      ),
  Post(
        username: "flutter_dev",
        profilePhoto: "https://avatars.githubusercontent.com/u/14101776?s=200&v=4",
        publication: 'https://thecamerastore.com/cdn/shop/articles/GINAYEOLANDSCAPE-1_800x.jpg?v=1687296669',
        likesCount: 1200,
        commentsCount: 342,
        repostCount: 89,
        shareCount: 210,
        description: "Exploring the beauty of Flutter 💙🚀 #flutter #dart #mobiledev",
      ),
  Post(
        username: "tech_guru",
        profilePhoto: "https://i.pravatar.cc/150?img=3",
        publication: "https://picsum.photos/500/300?random=3",
        likesCount: 2100,
        commentsCount: 410,
        repostCount: 132,
        shareCount: 320,
        description: "Latest trends in AI and ML 🤖🔥",
      ),
  Post(
        username: "design_daily",
        profilePhoto: "https://i.pravatar.cc/150?img=4",
        publication: "https://picsum.photos/500/300?random=4",
        likesCount: 754,
        commentsCount: 98,
        repostCount: 25,
        shareCount: 77,
        description: "Minimalist design inspiration 🎨",
          ),
  Post(
        username: "travel_addict",
        profilePhoto: "https://i.pravatar.cc/150?img=5",
        publication: "https://picsum.photos/500/300?random=5",
        likesCount: 3021,
        commentsCount: 520,
        repostCount: 189,
        shareCount: 410,
        description: "Wanderlust vibes 🌍✈️",
      ),
  Post(
        username: "foodie_life",
        profilePhoto: "https://i.pravatar.cc/150?img=6",
        publication: "https://picsum.photos/500/300?random=6",
        likesCount: 1890,
        commentsCount: 220,
        repostCount: 70,
        shareCount: 150,
        description: "Delicious pasta night 🍝❤️",
      ),
  Post(
        username: "fitness_pro",
        profilePhoto: "https://i.pravatar.cc/150?img=7",
        publication: "https://picsum.photos/500/300?random=7",
        likesCount: 2489,
        commentsCount: 333,
        repostCount: 122,
        shareCount: 205,
        description: "No pain, no gain 💪🔥",
      ),
  Post(
        username: "nature_lover",
        profilePhoto: "https://i.pravatar.cc/150?img=8",
        publication: "https://picsum.photos/500/300?random=8",
        likesCount: 4300,
        commentsCount: 620,
        repostCount: 202,
        shareCount: 499,
        description: "Green peace 🌳🍃",
      ),
  Post(
        username: "gaming_zone",
        profilePhoto: "https://i.pravatar.cc/150?img=9",
        publication: "https://picsum.photos/500/300?random=9",
        likesCount: 1999,
        commentsCount: 275,
        repostCount: 101,
        shareCount: 310,
        description: "Epic win on last nights stream 🎮🔥",
      ),
  Post(
        username: "music_vibes",
        profilePhoto: "https://i.pravatar.cc/150?img=10",
        publication: "https://picsum.photos/500/300?random=10",
        likesCount: 2891,
        commentsCount: 411,
        repostCount: 130,
        shareCount: 240,
        description: "Lost in the rhythm 🎶❤️",
      ),
  Post(
        username: "startup_world",
        profilePhoto: "https://i.pravatar.cc/150?img=11",
        publication: "https://picsum.photos/500/300?random=11",
        likesCount: 1200,
        commentsCount: 98,
        repostCount: 35,
        shareCount: 88,
        description: "Pitch day success 🚀💡",
      ),
  Post(
        username: "artsy_mind",
        profilePhoto: "https://i.pravatar.cc/150?img=12",
        publication: "https://picsum.photos/500/300?random=12",
        likesCount: 1705,
        commentsCount: 207,
        repostCount: 64,
        shareCount: 140,
        description: "Abstract art for the soul 🎨✨",
      ),
  Post(
        username: "photography_hub",
        profilePhoto: "https://i.pravatar.cc/150?img=13",
        publication: "https://picsum.photos/500/300?random=13",
        likesCount: 3400,
        commentsCount: 650,
        repostCount: 221,
        shareCount: 510,
        description: "Capturing moments 📸",
      ),
  Post(
        username: "sportsmania",
        profilePhoto: "https://i.pravatar.cc/150?img=14",
        publication: "https://picsum.photos/500/300?random=14",
        likesCount: 2800,
        commentsCount: 355,
        repostCount: 132,
        shareCount: 310,
        description: "Unstoppable energy ⚽🏀🏈",
      ),
  Post(
        username: "daily_quotes",
        profilePhoto: "https://i.pravatar.cc/150?img=15",
        publication: "https://picsum.photos/500/300?random=15",
        likesCount: 1450,
        commentsCount: 187,
        repostCount: 55,
        shareCount: 120,
        description: "Believe in yourself ✨💯",
      ),
  
];