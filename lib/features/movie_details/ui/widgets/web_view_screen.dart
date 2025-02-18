import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = true;
  String? errorMessage;
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('Watch Now', style: TextStyle(color: ColorManager.whiteFc)),
        iconTheme: IconThemeData(color: ColorManager.whiteFc),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(widget.url),
            ),
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              useShouldOverrideUrlLoading: true,
              allowFileAccessFromFileURLs: true,
              allowUniversalAccessFromFileURLs: true,
              mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              return NavigationActionPolicy.ALLOW;
            },
            onLoadStart: (controller, url) {
              setState(() {
                isLoading = true;
                errorMessage = null; // ✅ إخفاء أي خطأ عند بدء التحميل
              });
            },
            onLoadStop: (controller, url) {
              setState(() {
                isLoading = false;
                errorMessage = null; // ✅ التأكد من إزالة رسالة الخطأ بعد التحميل
              });
            },
            onReceivedHttpError: (controller, request, errorResponse) {
              setState(() {
                if (errorMessage == null) { // ✅ التأكد من عدم إظهار الخطأ بعد التحميل الناجح
                  isLoading = false;
                  errorMessage = "HTTP Error: ${errorResponse.statusCode}";
                }
              });
            },
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              return ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED); // ✅ تجاوز أخطاء SSL
            },
          ),
          if (isLoading)
            Center(child: CircularProgressIndicator()),
          if (errorMessage != null && isLoading == false) // ✅ لا تعرض الخطأ إذا تم تحميل الصفحة
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 60),
                  SizedBox(height: 16),
                  Text(
                    'Something went wrong',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(errorMessage!, textAlign: TextAlign.center),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        errorMessage = null;
                        isLoading = true;
                      });
                      webViewController?.reload();
                    },
                    child: Text('Reload'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
