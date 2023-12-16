import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatefulWidget {
  const AdaptiveButton(
      {super.key,
      this.width,
      this.height,
      required this.child,
       this.onPressed,
      this.color,
      this.borderRadius,
      this.enabledLoading,
      this.loadingWidget,
      this.padding,
      this.margin});

  /// [width] Changes the width property of the button
  final double? width;

  ///`[height] Changes the height property of the button.
  final double? height;

  ///[child] Determines the widget that will appear in the button. (required)
  final Widget child;

  /// [onPressed] It is used for the action that will run when the button is clicked. (required)
  final FutureOr<dynamic> Function()? onPressed;

  /// [enabledLoading] When set to `true`, it displays a widget as a child of the button in asynchronous operations. It defaults to `false`.
  final bool? enabledLoading;

  /// [loadingWidget] Sets the widget to be displayed as the child of the button while the button is loading.
  final Widget? loadingWidget;

  ///  [color] Sets the button's background color.
  final Color? color;

  /// [borderRadius] Allows the corners of the button to be ovalized. It defaults to `BorderRadius.circular(8)`
  final BorderRadius? borderRadius;

  /// [padding] Allows the padding. It defaults to `EdgeInsets.symmetric(horizontal: 16)`
  final EdgeInsetsGeometry? padding;

  /// [margin] Allows the padding. It defaults to `EdgeInsets.zero`
  final EdgeInsetsGeometry? margin;

  @override
  State<AdaptiveButton> createState() => _AdaptiveButtonState();
}

class _AdaptiveButtonState extends State<AdaptiveButton> {
  bool isLoading = false;
  double minHeight = 40;

  @override
  Widget build(BuildContext context) {
    // double? getHeight() {
    //   if (widget.height == null) {
    //     if (kIsWeb) {
    //       return 40;
    //     } else {
    //       return widget.height;
    //     }
    //   }
    //   return widget.height;
    // }

    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      margin: widget.margin ??
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: widget.width,
      height: widget.height,
      child: kIsWeb != true
          ? Platform.isIOS
              ? CupertinoButton(

                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                  padding: widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 16),
                  color: widget.color ?? Colors.purple,
                  onPressed: widget.onPressed!=null? widget.enabledLoading == true
                      ? isLoading != true
                          ? () async {
                              setState(() {
                                isLoading = true;
                              });
                              await widget.onPressed!();
                              setState(() {
                                isLoading = false;
                              });
                            }
                          : null
                      : widget.onPressed:null,
                  child: widget.enabledLoading == true
                      ? isLoading == true
                          ? widget.loadingWidget ??
                              const CupertinoActivityIndicator()
                          : widget.child
                      : widget.child)
              : ElevatedButton(

                  style: ElevatedButton.styleFrom(

                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8)),
                      backgroundColor: widget.color,
                      padding: widget.padding ??
                          const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4)),
                  onPressed: widget.onPressed!=null? widget.enabledLoading == true
                      ? isLoading != true
                      ? () async {
                    setState(() {
                      isLoading = true;
                    });
                    await widget.onPressed!();
                    setState(() {
                      isLoading = false;
                    });
                  }
                      : null
                      : widget.onPressed:null,
                  child: widget.enabledLoading == true
                      ? isLoading == true
                          ? Center(
                              child: widget.loadingWidget ??
                                  const CircularProgressIndicator(),
                            )
                          : widget.child
                      : widget.child)
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8)),
                  backgroundColor: widget.color,
                  padding: widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
              onPressed: widget.onPressed!=null? widget.enabledLoading == true
                  ? isLoading != true
                  ? () async {
                setState(() {
                  isLoading = true;
                });
                await widget.onPressed!();
                setState(() {
                  isLoading = false;
                });
              }
                  : null
                  : widget.onPressed:null,
              child: widget.enabledLoading == true
                  ? isLoading == true
                      ? Center(
                          child: widget.loadingWidget ??
                              const CircularProgressIndicator(),
                        )
                      : widget.child
                  : widget.child),
    );
  }
}
