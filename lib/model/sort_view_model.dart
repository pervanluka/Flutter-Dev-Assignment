import 'dart:math';
import 'package:flutter/material.dart';

class SortViewModel extends ChangeNotifier {
  bool _isLoading = false;
  late List<int> _randomIntegers;
  String? _timeTaken;

  bool get isLoading => _isLoading;
  List<int>? get randomIntegers => _randomIntegers;
  String? get timeTaken => _timeTaken;

  void handleButtonPress() {
    _isLoading = true;
    notifyListeners();

    Stopwatch stopwatch = Stopwatch()..start();

    _randomIntegers = generateRandomIntegers(25000000);
    quickSort(_randomIntegers, 0, _randomIntegers.length - 1).then((_) {
      stopwatch.stop();

      _isLoading = false;
      _timeTaken = 'Time taken: ${stopwatch.elapsed.inSeconds} seconds';
      notifyListeners();
    });
  }

  List<int> generateRandomIntegers(int count) {
    final random = Random();
    return List.generate(count, (_) => random.nextInt(10000000));
  }

  Future<List<int>> quickSort(List<int> arr, int left, int right) async {
    int index = partition(arr, left, right);
    if (left < index - 1) {
      await quickSort(arr, left, index - 1);
    }
    if (index < right) {
      await quickSort(arr, index, right);
    }
    return arr;
  }

  int partition(List<int> arr, int left, int right) {
    int pivot = arr[(left + right) ~/ 2];
    while (left <= right) {
      while (arr[left] < pivot) {
        left++;
      }
      while (arr[right] > pivot) {
        right--;
      }
      if (left <= right) {
        int temp = arr[left];
        arr[left] = arr[right];
        arr[right] = temp;
        left++;
        right--;
      }
    }
    return left;
  }
}
