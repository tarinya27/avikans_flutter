import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoExample extends StatefulWidget {
  @override
  _VideoExampleState createState() => _VideoExampleState();
}

class _VideoExampleState extends State<VideoExample> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('images/welcome1.mp4');
    _initializeVideoPlayer();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _videoPlayerController.setVolume(0); // Mute the video
      _videoPlayerController.setLooping(true); // Loop the video
      _videoPlayerController.play(); // Autoplay the video
    });
  }

  Future<void> _initializeVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {}); // Trigger a rebuild after initialization
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _videoPlayerController.value.isInitialized
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoPlayerController.value.size.width,
                      height: _videoPlayerController.value.size.height,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 40.0), // Add padding to move the text down
                child: Center(
                  child: Text(
                    'AVIKANS LIGHTING',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(), // Placeholder to push video to bottom
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30), // Adjust bottom margin
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20),
                  ),
                  child: Text("Get Started"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: VideoExample()));
}
