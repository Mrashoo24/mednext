import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    )..initialize().then((_) {
      setState(() {});
    });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Video Player Section
            if (_chewieController != null &&
                _videoPlayerController.value.isInitialized)
              Container(
                height: 230,
                child: Chewie(controller: _chewieController!),
              )
            else
              Center(child: CircularProgressIndicator()),

            // Title and buttons (Rate, Mark Complete)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pulmonology Image Based Questions",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Mark Complete Logic
                        },
                        child: Text("Mark Complete"),
                      ),
                      Row(
                        children: [
                          Text(
                            "Rate",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.star, color: Colors.orange),
                          Text("4.5"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // TabBar for "Up Next", "Related QBank", "Ask Query"
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "Up next"),
                      Tab(text: "Related QBank"),
                      Tab(text: "Ask Query"),
                    ],
                  ),
                  Container(
                    height: 300, // Adjust based on content
                    child: TabBarView(
                      children: [
                        // ListView for "Up Next" items
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  child: Text((index + 23).toString()),
                                ),
                                title: Text(
                                  'Pulmonology Image Based Questions',
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Row(
                                  children: [
                                    Icon(Icons.star, size: 16, color: Colors.orange),
                                    SizedBox(width: 4),
                                    Text("4.5"),
                                    SizedBox(width: 10),
                                    Text("20 min"),
                                  ],
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            );
                          },
                        ),
                        // Placeholder for "Related QBank"
                        Center(child: Text("Related QBank")),
                        // Placeholder for "Ask Query"
                        Center(child: Text("Ask Query")),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Row for additional functionalities (Save, Slides, Notes, Report Error)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.bookmark_border, color: Colors.blue),
                      Text("Save"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.slideshow, color: Colors.blue),
                      Text("Slides"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.note, color: Colors.blue),
                      Text("Notes"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red),
                      Text("Report Error"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
