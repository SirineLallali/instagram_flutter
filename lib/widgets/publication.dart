import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
