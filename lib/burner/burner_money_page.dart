import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:weightburner_119/burner/burner_local_model.dart';
import 'package:weightburner_119/burner/burner_provider.dart';

class BurnerMoneyPage extends StatefulWidget {
  final String link;
  final bool cache;

  const BurnerMoneyPage({
    super.key,
    required this.link,
    required this.cache,
  });

  @override
  State<StatefulWidget> createState() {
    return _BurnerMoneyPageState();
  }
}

class _BurnerMoneyPageState extends State<BurnerMoneyPage> {
  late WebViewController wbController;
  late String wvlnk;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    wvlnk = widget.link;
    wbController = WebViewController()
      ..loadRequest(Uri.parse(wvlnk))
      ..setNavigationDelegate(
        NavigationDelegate(onUrlChange: (url) async {
          log('Current URL : ${url.url}');
          if (widget.cache) {
            final burnerCurrentUrl = url.url ?? '';
            final burnerLocalObject = await BurnerRepository().burnerHGet();
            if (burnerLocalObject != null) {
              final burnerNewLocalObject = BurnerLocalModel(
                regburner: burnerLocalObject.regburner,
                strtburner: burnerLocalObject.strtburner,
                logburner: burnerLocalObject.logburner,
                cabburner: burnerCurrentUrl,
              );
              await BurnerRepository().burnerHSet(burnerNewLocalObject);
            }
          }
        }),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
    });
    _enableRotation();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await wbController.canGoBack()) {
          await wbController.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: WebViewWidget(
            controller: wbController,
          ),
        ),
      ),
    );
  }

  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
