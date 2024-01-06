import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:webview_universal/webview_universal.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIPMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  WebViewController webViewController = WebViewController();
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    task();
    
  }

  Future<void> task() async {
    await webViewController.init(
      context: context,
      uri: Uri.parse("https://hipmi.wibudev.com"),
      setState: (void Function() fn) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Text("Halo Ini Ada Dimana"),
            // Text(webViewController.is_init.toString()),
            webViewController.is_init 
                ? WebView(
                    controller: webViewController,
                  )
                : const Text("loading ...")
          ],
        ),
      ),
    );
  }
}
