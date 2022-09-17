/*
 * @Author: renjie.yin
 * @Date: 2022-05-16 09:22:41
 * @LastEditors: renjie.yin
 * @LastEditTime: 2022-09-14 09:33:51
 * @Description: 
 */
import 'package:yuedu_hd/db/BookSourceBean.dart';

class BookInfoBean {
  int id = 0;
  String? name;
  String? author;
  String? bookUrl;
  String? coverUrl;
  String? intro;
  String? kind;
  String? lastChapter;
  String? wordCount;
  String? lastReadChapter;
  int groupId = -1;
  int inbookShelf = 0;
  int lastReadPage = 1;

  //关联的书源
  int? source_id = -1;
  BookSourceBean? sourceBean;
  int sourceCount = 0;

  BookInfoBean();

  @override
  String toString() {
    return 'BookInfoBean{name: $name, author: $author, bookUrl: $bookUrl, coverUrl: $coverUrl, intro: $intro, kind: $kind, lastChapter: $lastChapter, wordCount: $wordCount}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookInfoBean &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          author == other.author;

  @override
  int get hashCode => name.hashCode ^ author.hashCode;

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'author': author,
      'bookUrl': bookUrl,
      'coverUrl': coverUrl,
      'intro': intro,
      'kind': kind,
      'lastChapter': lastChapter,
      'wordCount': wordCount
    };
  }

  BookInfoBean.fromMap(Map map) {
    id = map['_id'] ?? -1;
    name = map['name'];
    author = map['author'];
    bookUrl = map['bookUrl'];
    coverUrl = map['coverUrl']?.toString().replaceAll(".jpghtml", ".jpg");
    intro = map['intro'];
    kind = map['kind'];
    lastChapter = map['lastChapter'];
    wordCount = map['wordCount'];
    lastReadChapter = map['lastReadChapter'];
    groupId = map['groupId'] ?? -1;
    inbookShelf = map['inbookShelf'] ?? 0;
    lastReadPage = map['lastReadPage'] ?? 1;
  }
}
