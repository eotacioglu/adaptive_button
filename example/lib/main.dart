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
            /// Without [loadingWidget] property example and async function.
            AdaptiveButton(
              height: 50,
              width: MediaQuery.of(context).size.width,
              enabledLoading: true,
              child: const Center(
                  child: Text(
                      "AdaptiveButton - Without Custom Loading Widget(default: Adaptive indicator widget)")),
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

            /// With [loadingWidget] property example and async function.
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
              child: const Text("AdaptiveButton - Custom Loading Widget"),
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

            /// Without [loadingWidget] and [enabledLoading] property example and  without async function.
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

            /// Usage with [borderRadius] property.
            AdaptiveButton(
              borderRadius: BorderRadius.circular(20),
              color: Colors.cyan,
              child: const Text("AdaptiveButton - Border Radius"),
              onPressed: () async {
                debugPrint("AdaptiveButton Test Message");
              },
            ),

            /// Usage with [width] and [height] property.
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
