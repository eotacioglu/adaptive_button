import 'package:flutter/material.dart';
import 'dart:async';
import 'package:adaptive_button/adaptive_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: AdaptiveButtonView());
  }
}

class AdaptiveButtonView extends StatefulWidget {
  const AdaptiveButtonView({Key? key}) : super(key: key);

  @override
  State<AdaptiveButtonView> createState() => _AdaptiveButtonViewState();
}

class _AdaptiveButtonViewState extends State<AdaptiveButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purpleAccent,
        title: const Text('AdaptiveButton Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdaptiveButton(
              height: 50,
              width: MediaQuery.of(context).size.width,
              enabledLoading: true,

              child: const Text("AdaptiveButton - Non Loading Widget"),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text(
                          "Merhaba ben AdaptiveButton bulunduğum platforma göre şekillenirim:)"),
                    );
                  },
                );
              },
            ),
            AdaptiveButton(
              height: 50,
              width: MediaQuery.of(context).size.width,
              enabledLoading: true,
              loadingWidget: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  )),
              child: const Text("AdaptiveButton - Loading"),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 2));
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text(
                          "Merhaba ben AdaptiveButton bulunduğum platforma göre şekillenirim:)"),
                    );
                  },
                );
              },
            ),
            AdaptiveButton(
              color: Colors.amber,
              child: const Text(
                "AdaptiveButton",
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text(
                          "Merhaba ben AdaptiveButton bulunduğum platforma göre şekillenirim:)"),
                    );
                  },
                );
                debugPrint("AdaptiveButton Test Message");
              },
            ),
            AdaptiveButton(
              borderRadius: BorderRadius.circular(20),
              color: Colors.cyan,
              child: const Text("AdaptiveButton - Border Radius"),
              onPressed: () async {
                debugPrint("AdaptiveButton Test Message");
              },
            ),
            AdaptiveButton(
              width: 250,
              height: 150,
              borderRadius: BorderRadius.circular(16),
              color: Colors.deepOrange,
              child: const Text("AdaptiveButton - Sized"),
              onPressed: () async {
                debugPrint("AdaptiveButton Test Message");
              },
            ),
          ],
        ),
      ),
    );
  }
}
