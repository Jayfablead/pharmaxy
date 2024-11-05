import 'dart:async';
import 'dart:io';

import 'package:ecommerce/Widget/Const.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

class OpenPDF extends StatefulWidget {
  final File file;
  final String url;
  final provider;

  const OpenPDF(
      {Key? key, required this.file, required this.url, this.provider})
      : super(key: key);

  @override
  State<OpenPDF> createState() => _OpenPDFState();
}

class _OpenPDFState extends State<OpenPDF> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool downloading = false;
  int Progress = 0;

  late StreamSubscription progressStream;
  var filePath = "No Data";
  var platformVersion = "Unknown";
  Directory? externalDir;
  dynamic downloadId;
  String? status;

  @override
  void initState() {
    // TODO: implement initState
    FlDownloader.initialize();
    print("urlurlurlurlurlurlurl${widget.url.toString()}");
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        debugPrint('event.progress: ${event.progress}');
        setState(() {
          Progress = event.progress;
          downloading = false;
          downloadId = event.downloadId;
          status = event.status.name;
        });
        // This is a way of auto-opening downloaded file right after a download is completed
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.running) {
        debugPrint('event.progress: ${event.progress}');
        setState(() {
          downloading = true;
          Progress = event.progress;
          downloadId = event.downloadId;
          status = event.status.name;
        });
      } else if (event.status == DownloadStatus.failed) {
        debugPrint('event: $event');
        setState(() {
          downloading = false;
          Progress = event.progress;
          downloadId = event.downloadId;
          status = event.status.name;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    progressStream.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = path.basename(widget.file.path);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            "PDF view",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                var Permission = await FlDownloader.requestPermission();

                if (Permission == StoragePermissionStatus.granted) {
                  await FlDownloader.download(widget.url);
                }
              },
              icon: Icon(Icons.download, color: Colors.white),
            ),
          ],
        ),
        key: _scaffoldKey,
        body: downloading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Downloading: ${Progress} '),
                  ],
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 70.h,
                    child: PDFView(
                      filePath: widget.file.path,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class OpenPdfUtil {
  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = path.basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }
}
