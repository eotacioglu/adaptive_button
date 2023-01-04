# AdaptiveButton

While AdaptiveButton is compatible with the platform, it disables the clicking feature of the button
for your asynchronous operations and displays a widget on the button while waiting.

## Getting Started

Import the following package.

```dart
import 'package:adaptive_button/adaptive_button.dart';
```

iOS Example

![](https://github.com/eotacioglu/adaptive_button/raw/main/example/lib/assets/adaptiveButton.webp) ![](https://github.com/eotacioglu/adaptive_button/raw/main/example/lib/assets/adaptiveLoading.webp) ![](https://github.com/eotacioglu/adaptive_button/raw/main/example/lib/assets/clicked.webp)

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
        child: AdaptiveButton(
            child: Text("AdaptiveButton"),
            onPressed: () async {}
        ),
      ));
}
```