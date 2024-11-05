import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';

class Privacy_Policy extends StatefulWidget {
  Privacy_Policy({super.key});

  @override
  State<Privacy_Policy> createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {
  late InAppWebViewController _webViewController;

  bool _load = true;

  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18.sp),
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(null),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 80.h,
                  child: InAppWebView(
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        transparentBackground: true,
                      ),
                    ),
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          'https://pharmato.fableadtechnolabs.com/admin/invoice/79'),
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      _webViewController = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, Uri? url) {
                      setState(() {
                        _load =
                            true; // You might want to set _load to true here to indicate loading.
                      });
                    },
                    onLoadStop: (InAppWebViewController controller, Uri? url) {
                      setState(() {
                        _load = false;
                        print('loading : $_load');
                      });
                    },
                  ),
                ),
                if (_load)
                  Positioned(
                      top: 37.h,
                      left: 45.w,
                      child: CircularProgressIndicator()),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
