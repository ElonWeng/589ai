import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runtool/base/model/loading_model.dart';
import 'package:runtool/base/model/toast_model.dart';

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
    final toast = context.watch<ToastModel>();
    print('当前的数据${toast.toastMsg}');
    return Stack(
      children: [
        widget.child,
        if (loadingOverlayState.isLoading)
          Container(
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
        if (toast.toastMsg.isNotEmpty)
          Center(
            child: AutoDisappearText(toastMsg: toast.toastMsg,)
          ),
      ],
    );
  }
}

class AutoDisappearText extends StatefulWidget {
  final String toastMsg;
  const AutoDisappearText( {super.key, required this.toastMsg});
  @override
  _AutoDisappearTextState createState() => _AutoDisappearTextState();

}

class _AutoDisappearTextState extends State<AutoDisappearText> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // 1秒后设置_isVisible为false，使文本消失
    Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        _isVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible ? Text(widget.toastMsg) : Container();
  }
}
