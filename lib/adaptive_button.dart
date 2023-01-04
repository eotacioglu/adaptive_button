library adaptive_button;

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
export 'package:adaptive_button/adaptive_button.dart';
class AdaptiveButton extends StatefulWidget {
  const AdaptiveButton(
      {super.key,
      this.width,
      this.height,
      required this.child,
      required this.onPressed,
      this.color,
      this.borderRadius,
      this.enabledLoading,
      this.loadingWidget});

  final double? width;
  final double? height;
  final Widget child;
  final Color? color;
  final bool? enabledLoading;
  final BorderRadius? borderRadius;
  final Future Function() onPressed;
  final Widget? loadingWidget;

  @override
  State<AdaptiveButton> createState() => _AdaptiveButtonState();
}

class _AdaptiveButtonState extends State<AdaptiveButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: const EdgeInsets.all(8),
      child:
      kIsWeb !=true?
      Platform.isIOS
          ? CupertinoButton(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: widget.color ?? Colors.purple,
              onPressed: widget.enabledLoading == true
                  ? isLoading != true
                      ? () async {
                          setState(() {
                            isLoading = true;
                          });
                          await widget.onPressed();
                          setState(() {
                            isLoading = false;
                          });
                        }
                      : null
                  : widget.onPressed,
              child: widget.enabledLoading == true
                  ? isLoading == true
                      ? widget.loadingWidget!
                      : widget.child
                  : widget.child)
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8)),
                  backgroundColor: widget.color,
                  padding: const EdgeInsets.symmetric(horizontal: 8)),
              onPressed: widget.enabledLoading == true
                  ? isLoading != true
                      ? () async {
                          setState(() {
                            isLoading = true;
                          });
                          await widget.onPressed();
                          setState(() {
                            isLoading = false;
                          });
                        }
                      : null
                  : widget.onPressed,
              child: widget.enabledLoading == true
                  ? isLoading == true
                      ? widget.loadingWidget
                      : widget.child
                  : widget.child): ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(8)),
              backgroundColor: widget.color,
              padding: const EdgeInsets.symmetric(horizontal: 8)),
          onPressed: widget.enabledLoading == true
              ? isLoading != true
              ? () async {
            setState(() {
              isLoading = true;
            });
            await widget.onPressed();
            setState(() {
              isLoading = false;
            });
          }
              : null
              : widget.onPressed,
          child: widget.enabledLoading == true
              ? isLoading == true
              ? widget.loadingWidget
              : widget.child
              : widget.child),
    );
  }
}
