import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RecordingProvider extends ChangeNotifier {
  bool isRecording = false;
  String formattedTime = "00:00";
  String? recordedAudioPath;
  String? audioUrl;

  void toggleRecording() {
    isRecording = !isRecording;
    if (isRecording) {
      startRecording();
    } else {
      stopRecording();
    }
    notifyListeners();
  }

  void startRecording() {
    formattedTime = "00:00";
    notifyListeners();
  }

  void stopRecording() async {
    final directory = await getTemporaryDirectory();
    recordedAudioPath = '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
    formattedTime = "02:34";
    notifyListeners();
  }

  Future<void> uploadAudio() async {
    if (recordedAudioPath == null) {
      throw Exception("No audio recorded.");
    }

    final file = File(recordedAudioPath!);

    if (!file.existsSync()) {
      throw Exception("Audio file does not exist.");
    }

    try {
      final storageRef = FirebaseStorage.instance.ref().child('audio/${DateTime.now().millisecondsSinceEpoch}.m4a');
      await storageRef.putFile(file);
      audioUrl = await storageRef.getDownloadURL();

      // Check if audioUrl is successfully retrieved
      if (audioUrl != null && audioUrl!.isNotEmpty) {
        print("Audio uploaded successfully: $audioUrl");
      } else {
        throw Exception("Failed to get audio URL.");
      }

      notifyListeners();
    } catch (e) {
      print("Failed to upload audio: $e");
      throw Exception("Failed to upload audio: $e");
    }
  }
}