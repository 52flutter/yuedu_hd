/*
 * @Author: renjie.yin
 * @Date: 2022-05-16 09:22:41
 * @LastEditors: renjie.yin
 * @LastEditTime: 2022-05-16 14:04:14
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuedu_hd/db/source_verify_helper.dart';
import 'package:yuedu_hd/ui/widget/space.dart';

class DialogImportSource extends StatefulWidget {
  final String url;
  final bool needCheck;

  const DialogImportSource(
      {Key? key, required this.url, required this.needCheck})
      : super(key: key);

  @override
  State<DialogImportSource> createState() {
    return DialogImportSourceState();
  }
}

class DialogImportSourceState extends State<DialogImportSource> {
  String progressText = "正在导入...";
  bool hasDone = false;
  @override
  void initState() {
    SourceVerifyHelper().importJsonUrl(widget.url, widget.needCheck,
        (text, done) {
      setState(() {
        progressText = text;
        hasDone = done;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("导入书源"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          hasDone ? SizedBox() : CircularProgressIndicator(),
          VSpace(8),
          Text(progressText),
        ],
      ),
      actions: [
        if (hasDone)
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('关闭')),
      ],
    );
  }
}
