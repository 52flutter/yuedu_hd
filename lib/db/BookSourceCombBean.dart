/*
 * @Author: renjie.yin
 * @Date: 2022-05-16 09:22:41
 * @LastEditors: renjie.yin
 * @LastEditTime: 2022-09-03 15:43:52
 * @Description: 
 */
import 'package:yuedu_hd/db/BookSourceBean.dart';

class BookSourceCombBean {
  late int id;
  late int bookid;
  late int sourceid;
  late String bookurl;
  int used = 0;

  BookSourceBean? sourceBean;
  String? lastChapterName;

  BookSourceCombBean.fromMap(Map map) {
    id = map['_id'];
    bookid = map['bookid'];
    sourceid = map['sourceid'];
    bookurl = map['bookurl'];
    used = map['used'] ?? 0;
  }

  BookSourceCombBean();
}
