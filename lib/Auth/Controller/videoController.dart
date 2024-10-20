import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../constants/global.dart';
import '../../data/models/videoModel.dart';

class VideoController extends GetxController {
  List<VideoModel> videos = [];
  bool videoloading = false;

  // Call this method to load cached data initially
  void loadCachedData() {
    // Load videos from cache if available
    if (box.hasData('videos')) {
      var cachedVideos = box.read<List>('videos');
      videos =
          cachedVideos?.map((video) => VideoModel.fromJson(video)).toList() ??
              [];
      update();
      getVideos();
    } else {
      getVideos();
    }
  }

  Future<void> getVideos() async {
    if (videos.isEmpty) {
      videoloading = true;
      update();
    }

    try {
      // Fetch data from Firestore
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('videos').get();

      // Map Firestore data to Video model
      videos = querySnapshot.docs
          .map((doc) => VideoModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      // Cache the fetched videos
      box.write('videos', videos.map((video) => video.toJson()).toList());

      update();
    } catch (e) {
      print("Error fetching videos: $e");
    } finally {
      videoloading = false;
      update();
    }
  }

  List<VideoModel> getVideosForSubject(String subjectId) {
    if (videos.isNotEmpty) {
      var listOfVideos =
          videos.where((element) => element.subjectId == subjectId).toList();
      return listOfVideos;
    } else {
      return [];
    }
  }

  List<VideoModel> getRecommendedVideoForSubject(String subjectId) {
    if (videos.isNotEmpty) {
      var listOfVideos =
          videos.where((element) => (element.subjectId == subjectId) && (element.recommended ?? false)).toList();
      return listOfVideos;
    } else {
      return [];
    }
  }
}
