import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:weightburner_119/core/wb_colors.dart';

class WebFF extends StatefulWidget {
  final String url;
  final String title;

  const WebFF({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebFF> createState() => _WebPlinkState();
}

class _WebPlinkState extends State<WebFF> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WbColors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.h,
            color: WbColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const BackButton(color: WbColors.black),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
