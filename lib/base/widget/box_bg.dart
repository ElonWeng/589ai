import 'package:flutter/material.dart';

class BoxBgWidget extends StatefulWidget {
  final Widget child;
  final double? height;
  final double? width;

  const BoxBgWidget({Key? key, required this.child, this.height, this.width}) : super(key: key);

  @override
  BoxBgWidgetState createState() => BoxBgWidgetState();
}

class BoxBgWidgetState extends State<BoxBgWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      // 你可以根据需要调整padding、margin和width
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5), // 灰色半透明背景
        borderRadius: BorderRadius.circular(10.0), // 圆角
      ),
      child: widget.child,
    );
  }
}
