import 'dart:async';
import 'package:flutter/material.dart';

class RecordingProvider extends ChangeNotifier {
  bool isRecording = false;
  bool isPause = false;
  Timer? timer;
  int allSeconds = 0;

  bool get hasPermission => true;

  void startRecord() {
    if (hasPermission) {
      isRecording = true;
      isPause = false;
      notifyListeners();

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        allSeconds++;
        notifyListeners();
      });
    } else {
      print("No microphone permission");
    }
  }

  void resetRecording() {
    isRecording = false;
    allSeconds = 0;
    timer?.cancel();
    notifyListeners();
  }

  void pauseRecording() {
      isRecording = false;
      isPause = true;
      timer?.cancel();
      notifyListeners();
  }

  String get formattedTime {
    int hours = allSeconds ~/ 3600;
    int minutes = (allSeconds - (hours * 3600)) ~/ 60;
    int seconds = (allSeconds - (hours * 3600) - (minutes * 60));
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
