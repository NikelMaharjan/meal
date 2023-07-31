

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal/models/meals.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatelessWidget {

  Meals meal;
  VideoPage(this.meal);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, ore){
        if(ore == Orientation.landscape){
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
            SystemUiOverlay.bottom
          ]);

        }
        return WillPopScope(   //back button
          onWillPop: () async {
            if(ore == Orientation.landscape){ //if screen is in landscape mode, it will first change to portrait mode
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown]);
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
                SystemUiOverlay.top
              ]);
              return false;
            }
            else {
              return true;  //can only do back in portrait mode
            }
          },
          child: Scaffold(
            body: Center(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(meal.videoId).toString(),
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                ),
                // showVideoProgressIndicator: true,
              ),
            ),

          ),
        );

      },
    );
  }
}
