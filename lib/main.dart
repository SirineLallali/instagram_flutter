
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insta/widgets/bottom_navigation.dart';
import 'package:insta/widgets/custom_button.dart';
import 'package:insta/widgets/instagram_card.dart';
import 'package:insta/widgets/save_button.dart';
import 'package:http/http.dart' as http;

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
        body: View()
      ), );
  }
}

class View extends StatelessWidget {
  const View({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
           return Center(child: Text("Error: ${snapshot.error}"));
        }
        else{
          final posts = snapshot.data ?? [];
          return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
        itemBuilder: (context, index) {
          final post =posts[index];
          return InstagramCard(post: post); 
        },
        itemCount: posts.length,
        );
        }
      }
    );
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
  String username;
  final String profilePhoto;
  final String publication;
  final int likesCount;
  final int commentsCount;
  final int repostCount;
  final int shareCount;
  final String description;
  final int id;
  final int userId;

  Post ({
    this.username = '',
    required this.profilePhoto,
    required this.publication,
    required this.likesCount,
    required this.commentsCount,
    required this.repostCount,
    required this.shareCount,
    required this.description,
    required this.id,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        profilePhoto: 'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp', 
        publication: 'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp', 
        likesCount: 0, 
        commentsCount: 0, 
        repostCount: 0, 
        shareCount: 0, 
        description: json["body"],
        id: json["id"],
        userId: json["userId"]);
  }
}

class Comment {
  final String username;
  final String text;
  final String pfpUrl;
  Comment ({
    required this.username,
    required this.text,
    required this.pfpUrl,
  });

   factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(
      username: json["name"], 
      text: json["body"], 
      pfpUrl: 'https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png');
  }
}

class User {
  final int id;
  final String username;
  User ({
    required this.id,
    required this.username
  });
  
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      username: json["name"], 
      id: json["id"], );
  }
}
Future <List<Post>> fetchPosts () async {
  try {
     final postResponse = await http
    .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),)
    .timeout(Duration(seconds: 5));
    final userResponse = await http
    .get(Uri.parse("https://jsonplaceholder.typicode.com/users"),)
    .timeout(Duration(seconds: 5));
    final commentResponse = await http
    .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"),)
    .timeout(Duration(seconds: 5));
  if (postResponse.statusCode == 200 && userResponse.statusCode == 200 && commentResponse.statusCode == 200 ) {
    final List<dynamic> postData = json.decode(postResponse.body);
    final List<dynamic> userData = json.decode(userResponse.body);
    final List<dynamic> commentData = json.decode(commentResponse.body);
    List<User> users= userData.map((user) => User.fromJson(user)).toList();
    List<Post> posts =postData.map((post) => Post.fromJson(post)).toList();
    List<Comment> comments =commentData.map((comment) => Comment.fromJson(comment)).toList();
    for ( var auser in users){
      for ( var apost in posts){
        if (apost.userId == auser.id) {
           apost.username = auser.username; 
          }
       }
    }
    return posts;
  }
  else{
    throw Exception('Failed to load posts');
  }
  } catch (e) {
    throw Exception('problem at fetching post');
  }
}

Future <List<Comment>> fetchComments () async {
  try {
     final response = await http
    .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"),)
    .timeout(Duration(seconds: 5));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    Future<List<Post>> posts = fetchPosts();
    for (var apost in posts) {
      
    }
    return data.map((comment) => Comment.fromJson(comment)).toList();
  }
  else{
    throw Exception('Failed to load comments');
  }
  } catch (e) {
    throw Exception('problem at fetching comment');
  }
}


// final List<Post> posts = [
//   Post(
//         username: 'aacoding_tips', 
//         profilePhoto: 'https://i.insider.com/5fbe98c550e71a0011557672?width=700', 
//         publication: 'https://cms-assets.themuse.com/media/lead/01212022-1047259374-coding-classes_scanrail.jpg', 
//         likesCount: 1321, 
//         commentsCount: 123, 
//         repostCount: 232, 
//         shareCount: 328, 
//         description: 'Beautiful Vs Codes Themes ergvbldnfjeiefnehugurgbjbhuuwehuerwubgugqe9u3t0rgwhoeirhy8utuewqueugrbvsffofourghwroewueeffbjkfbhoqwryuirjsfbvasndoeihroewuefdhdshvdh'
//       ),
//   Post(
//         username: "flutter_dev",
//         profilePhoto: 'https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png',
//         publication: 'https://thecamerastore.com/cdn/shop/articles/GINAYEOLANDSCAPE-1_800x.jpg?v=1687296669',
//         likesCount: 1200,
//         commentsCount: 342,
//         repostCount: 89,
//         shareCount: 210,
//         description: "Exploring the beauty of Flutter 💙🚀 #flutter #dart #mobiledev",
//       ),
//   Post(
//         username: "tech_guru",
//         profilePhoto: 'https://posterjack.ca/cdn/shop/articles/Tips_for_Taking_Photos_at_the_Beach_55dd7d25-11df-4acf-844f-a5b4ebeff4df.jpg?v=1738158629&width=1500',
//         publication: "https://picsum.photos/500/300?random=3",
//         likesCount: 2100,
//         commentsCount: 410,
//         repostCount: 132,
//         shareCount: 320,
//         description: "Latest trends in AI and ML 🤖🔥",
//       ),
//   Post(
//         username: "design_daily",
//         profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSabrBZxuW139T0wCclOEZlj8-uf_pZX2gjw&s',
//         publication: "https://picsum.photos/500/300?random=4",
//         likesCount: 754,
//         commentsCount: 98,
//         repostCount: 25,
//         shareCount: 77,
//         description: "Minimalist design inspiration 🎨",
//           ),
//   Post(
//         username: "travel_addict",
//         profilePhoto: 'https://images.unsplash.com/photo-1497316730643-415fac54a2af?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//         publication: "https://picsum.photos/500/300?random=5",
//         likesCount: 3021,
//         commentsCount: 520,
//         repostCount: 189,
//         shareCount: 410,
//         description: "Wanderlust vibes 🌍✈️",
//       ),
//   Post(
//         username: "foodie_life",
//         profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuQGHKexWoNife5mckGZdRl_GbDLwr6xgO7Q&s',
//         publication: "https://picsum.photos/500/300?random=6",
//         likesCount: 1890,
//         commentsCount: 220,
//         repostCount: 70,
//         shareCount: 150,
//         description: "Delicious pasta night 🍝❤️",
//       ),
//   Post(
//         username: "fitness_pro",
//         profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1z3WO2y5h7YkHljxIsvwuOxP21OE_8tnedA&s',
//         publication: "https://picsum.photos/500/300?random=7",
//         likesCount: 2489,
//         commentsCount: 333,
//         repostCount: 122,
//         shareCount: 205,
//         description: "No pain, no gain 💪🔥",
//       ),
//   Post(
//         username: "nature_lover",
//         profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_M4wMFN1yfKuYtjd6gy1EIw3PxWGeEoVB6g&s',
//         publication: "https://picsum.photos/500/300?random=8",
//         likesCount: 4300,
//         commentsCount: 620,
//         repostCount: 202,
//         shareCount: 499,
//         description: "Green peace 🌳🍃",
//       ),
//   Post(
//         username: "gaming_zone",
//         profilePhoto: 'https://iso.500px.com/wp-content/uploads/2016/11/stock-photo-159533631-1500x1000.jpg',
//         publication: "https://picsum.photos/500/300?random=9",
//         likesCount: 1999,
//         commentsCount: 275,
//         repostCount: 101,
//         shareCount: 310,
//         description: "Epic win on last nights stream 🎮🔥",
//       ),
//   Post(
//         username: "music_vibes",
//         profilePhoto: 'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp',
//         publication: "https://picsum.photos/500/300?random=10",
//         likesCount: 2891,
//         commentsCount: 411,
//         repostCount: 130,
//         shareCount: 240,
//         description: "Lost in the rhythm 🎶❤️",
//       ),
//   Post(
//         username: "startup_world",
//         profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_4B03GXx9gyLSCXQuRcx46nRdlVUd6CCx_g&s',
//         publication: "https://picsum.photos/500/300?random=11",
//         likesCount: 1200,
//         commentsCount: 98,
//         repostCount: 35,
//         shareCount: 88,
//         description: "Pitch day success 🚀💡",
//       ),
//   Post(
//         username: "artsy_mind",
//         profilePhoto: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRXxfn1j1vKFy8yJeBGl2AS6Dcah-lKgHofg&s',
//         publication: "https://picsum.photos/500/300?random=12",
//         likesCount: 1705,
//         commentsCount: 207,
//         repostCount: 64,
//         shareCount: 140,
//         description: "Abstract art for the soul 🎨✨",
//       ),
//   Post(
//         username: "photography_hub",
//         profilePhoto: 'https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg',
//         publication: "https://picsum.photos/500/300?random=13",
//         likesCount: 3400,
//         commentsCount: 650,
//         repostCount: 221,
//         shareCount: 510,
//         description: "Capturing moments 📸",
//       ),
//   Post(
//         username: "sportsmania",
//         profilePhoto: 'https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//         publication: "https://picsum.photos/500/300?random=14",
//         likesCount: 2800,
//         commentsCount: 355,
//         repostCount: 132,
//         shareCount: 310,
//         description: "Unstoppable energy ⚽🏀🏈",
//       ),
//   Post(
//         username: "daily_quotes",
//         profilePhoto: 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2018/10/taking-beautiful-photos-of-nature-2.jpg?resize=1500%2C1000&ssl=1',
//         publication: "https://picsum.photos/500/300?random=15",
//         likesCount: 1450,
//         commentsCount: 187,
//         repostCount: 55,
//         shareCount: 120,
//         description: "Believe in yourself ✨💯",
//       ),
// ];

// final List<Comment> comments = [
//   Comment(username: "flutter_dev", text: "Wow! This looks amazing 🔥", pfpUrl: 'https://i.insider.com/5fbe98c550e71a0011557672?width=700'),
//   Comment(username: "aacoding_tips", text: "Great explanation 👌", pfpUrl: 'https://posterjack.ca/cdn/shop/articles/Tips_for_Taking_Photos_at_the_Beach_55dd7d25-11df-4acf-844f-a5b4ebeff4df.jpg?v=1738158629&width=1500'),
//   Comment(username: "design_daily", text: "Love this theme 🎨", pfpUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSabrBZxuW139T0wCclOEZlj8-uf_pZX2gjw&s'),
//   Comment(username: "travel_addict", text: "Take me there 😍", pfpUrl: 'https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png'),
//   Comment(username: "foodie_life", text: "Im hungry now 🍔🍟", pfpUrl: 'https://images.unsplash.com/photo-1497316730643-415fac54a2af?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
//   Comment(username: "fitness_pro", text: "Keep grinding 💪", pfpUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuQGHKexWoNife5mckGZdRl_GbDLwr6xgO7Q&s'),
//   Comment(username: "nature_lover", text: "So peaceful 🌿", pfpUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1z3WO2y5h7YkHljxIsvwuOxP21OE_8tnedA&s'),
//   Comment(username: "gaming_zone", text: "GG bro 🎮", pfpUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_M4wMFN1yfKuYtjd6gy1EIw3PxWGeEoVB6g&s'),
//   Comment(username: "music_vibes", text: "This song is stuck in my head 🎶", pfpUrl: 'https://iso.500px.com/wp-content/uploads/2016/11/stock-photo-159533631-1500x1000.jpg'),
//   Comment(username: "startup_world", text: "Lets change the world 🚀", pfpUrl: 'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp'),
//   Comment(username: "artsy_mind", text: "Beautiful composition ✨", pfpUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_4B03GXx9gyLSCXQuRcx46nRdlVUd6CCx_g&s'),
//   Comment(username: "photography_hub", text: "Perfect lighting 📸", pfpUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRXxfn1j1vKFy8yJeBGl2AS6Dcah-lKgHofg&s'),
//   Comment(username: "sportsmania", text: "What a game! ⚽🏀", pfpUrl: 'https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg'),
//   Comment(username: "daily_quotes", text: "Needed this today 🙌", pfpUrl: 'https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//   Comment(username: "tech_guru", text: "AI is the future 🤖", pfpUrl: 'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2018/10/taking-beautiful-photos-of-nature-2.jpg?resize=1500%2C1000&ssl=1'),
// ];