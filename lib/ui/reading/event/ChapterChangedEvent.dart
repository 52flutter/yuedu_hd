/*
 * @Author: renjie.yin
 * @Date: 2022-05-16 09:22:41
 * @LastEditors: renjie.yin
 * @LastEditTime: 2022-05-19 20:14:04
 * @Description: 
 */
import 'package:flutter/cupertino.dart';

class ChapterChangedEvent extends ChangeNotifier {
  static ChapterChangedEvent? _instance;
  static ChapterChangedEvent getInstance() {
    if (_instance == null) {
      _instance = ChapterChangedEvent._();
    }
    return _instance!;
  }

  ChapterChangedEvent._() {
    //pass
  }

  String? chapterName;
  int? chapterId;

  String? url;

  int? chapterTotal;

  int? currChapterIndex;

  void emit(String name, int cid, String url, int chapterTotal,
      int currChapterIndex) {
    chapterName = name;
    chapterId = cid;
    url = url;
    chapterTotal = chapterTotal;
    currChapterIndex = currChapterIndex;
    notifyListeners();
  }
}
