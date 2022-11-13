import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MyShareTask extends StatefulWidget {
  const MyShareTask({Key? key}) : super(key: key);

  @override
  State<MyShareTask> createState() => _MyShareTaskState();
}

class _MyShareTaskState extends State<MyShareTask> {
  var selectedFile;
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharing of text-url-file'),
      ),
      body: Center(
        child: Container(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                onPressed: () {
                  Share.share(
                    'Welcome to file sharing',
                    subject: 'Welcome to flutter',
                  );
                },
                child: Text(
                  'Sharing of Text',
                ),
              ),
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                onPressed: () {
                  Share.share(
                    'visit flutter at https://www.fluttercampus.com',
                  );
                },
                child: Text(
                  'Sharing of Urls',
                ),
              ),
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                onPressed: () async {
                  //selectedFile = await FilePicker.platform.getFile();
                  result = await FilePicker.platform.pickFiles(
                      type: FileType.custom, allowedExtensions: ['jpg', 'png']);
                  if (result == null) return;

                  PlatformFile file1 = result!.files.first;
                  selectedFile = file1.toString();
                  setState(() {});
                },
                child: Text(
                  'Pick File to share',
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(selectedFile == null ? 'No File Selected' : selectedFile),
              SizedBox(
                height: 28,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (selectedFile == null) {
                    print('=====No File Selected=====');
                  } else {
                    Share.shareFiles(['${result!.files.single.path}'],
                        text: 'View Files');
                  }
                  setState(() {});
                },
                child: Text(
                  'Share Picked file',
                ),
              ),
              SizedBox(
                height: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
