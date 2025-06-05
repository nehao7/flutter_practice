import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewsScreen extends StatefulWidget {
  const WebViewsScreen({super.key});

  @override
  State<WebViewsScreen> createState() => _WebViewsScreenState();
}

class _WebViewsScreenState extends State<WebViewsScreen> {
  bool isLoading = true; // Variable to track if the WebView is still loading
  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        WebViewController()
          ..setJavaScriptMode(
            JavaScriptMode.unrestricted,
          ) // Allow JavaScript execution in WebView
          ..setBackgroundColor(
            const Color(0x00000000),
          ) // Set WebView background to transparent
          ..setNavigationDelegate(
            // Set navigation event handlers
            NavigationDelegate(
              // Called when a new page starts loading
              onPageStarted: (url) {
                setState(() {
                  isLoading =
                      true; // Show loading indicator when page starts loading
                });
              },
              // Called when the page finishes loading
              onPageFinished: (url) {
                setState(() {
                  isLoading =
                      false; // Hide loading indicator when page finishes loading
                });
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://pub.dev/packages/webview_flutter/versions'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Webview")),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri("https://quiz.o7solutions.in/#/"),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
                supportZoom: true,
              ),
            ),
          ),

          // WebViewWidget(controller: controller),
          // // Show CircularProgressIndicator if the page is loading
          // if (isLoading)
          //   const Center(
          //     child: CircularProgressIndicator(), // Loading spinner in the center of the screen
          //   ),
        ],
      ),
    );
  }
}
