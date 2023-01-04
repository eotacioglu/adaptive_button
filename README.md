# adaptive_button

Flutter AdaptiveButton

## Getting Started

Import the following package.

```dart
import 'package:adaptive_button/adaptive_button.dart';
```

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

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