import 'package:flutter/material.dart';
import 'package:fluttertune/constants/app_constant.dart';
import 'package:fluttertune/helpers/ui_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebviewScreen extends StatelessWidget {
  final String title;
  final String url;

  CustomWebviewScreen(this.title,this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: WebView(
        initialUrl: url,
        onWebViewCreated: (WebViewController controller) {
          print('onWebViewCreated ${controller.toString()}');
        },
        onPageStarted: (String started) {
          print('onPageStarted $started');
        },
        onPageFinished: (String finished) {
          print('onPageFinished $finished');
        },
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      elevation: AppConstant.px0,
      leading: MyShaderMask(
        child: BackButton(),
      ),
      backgroundColor: AppConstant.BgColor,
      title: MyShaderMask(
          child: Text(
            title,
            style: GoogleFonts.lato(),
          )),
      centerTitle: true,
    );
  }
}
