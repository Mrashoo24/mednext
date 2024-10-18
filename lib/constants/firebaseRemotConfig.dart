import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  static final RemoteConfigService _instance = RemoteConfigService._internal();

  factory RemoteConfigService() {
    return _instance;
  }

  RemoteConfigService._internal() : _remoteConfig = FirebaseRemoteConfig.instance;

  // Initialize Remote Config and fetch values from the Firebase server
  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1), // Adjust for production use
      ));

      // Fetch remote config values initially
      await _remoteConfig.fetchAndActivate();

      // Set up real-time listener for Remote Config updates
      setupRealTimeListener();
    } catch (e) {
      print("Remote Config initialization failed: $e");
    }
  }

  // Real-time listener for Remote Config updates
  void setupRealTimeListener() {
    _remoteConfig.onConfigUpdated.listen((event) async {
      print("Remote Config updated, fetching latest values...");

      // Fetch the updated values when a real-time update occurs
      await _remoteConfig.activate();

      // Optionally, notify the app of the changes (e.g., using a callback, stream, or state management)
    });
  }

  // Method to fetch banner_home JSON with key 'banner_home's

  List<Map<String, dynamic>> getHomeBanner() {
    final bannerJson = _remoteConfig.getString('banner_homepage');
    if (bannerJson.isNotEmpty) {
      try {
        final bannerMap =   List<Map<String, dynamic>>.from(jsonDecode(bannerJson).map((e) => e).toList());
        return bannerMap;
      } catch (e) {
        print("Error parsing banner_home JSON: $e");
      }
    }
    return [];
  }
}
