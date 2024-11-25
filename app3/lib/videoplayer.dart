import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoplayer extends StatefulWidget {
  final String videoUrl;

  Videoplayer({required this.videoUrl});

  @override
  _VideoplayerState createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    
    String videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,  
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live videos')),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          YoutubePlayer(
            controller: _controller,  
            showVideoProgressIndicator: true, 
          ),
        ],
      ),
    );
  }
}
