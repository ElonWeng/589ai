import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runtool/base/model/loading_model.dart';

class LoadingOverlay extends StatefulWidget {
  final Widget child;

  const LoadingOverlay({Key? key, required this.child}) : super(key: key);

  @override
  LoadingOverlayState createState() => LoadingOverlayState();
}

class LoadingOverlayState extends State<LoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    final loadingOverlayState = context.watch<LoadingModel>();
    return Stack(
      children: [
        widget.child,
        if (loadingOverlayState.isLoading)
          Container(
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}