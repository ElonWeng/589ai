import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runtool/base/config/config_page.dart';
import 'package:runtool/base/config/language_key.dart';
import 'package:runtool/base/model/loading_model.dart';
import 'package:runtool/base/model/local_model.dart';
import 'package:runtool/base/store/login_store.dart';
import 'package:runtool/base/util/shared_preferences_util.dart';
import 'package:runtool/base/util/snackbar_util.dart';
import 'package:runtool/base/widget/local_text.dart';
import 'package:runtool/base/widget/toast_widget.dart';
import 'package:runtool/ui/login/login_model.dart';
import 'package:runtool/ui/login/privacypolicy_page.dart';
import 'package:runtool/ui/login/serviceterms_page.dart';

import '../../base/config/configs.dart';
import '../../base/model/toast_provider.dart';
import '../../base/util/check_util.dart';
import '../../base/widget/loading_widget.dart';

class CodePage extends StatefulWidget {
  final Map<String, dynamic> arguments;

   const CodePage({Key? key, required this.arguments}) : super(key: key);


  @override
  State<CodePage> createState() => _CodePageState();

}

class _CodePageState extends State<CodePage> {
  final TextEditingController _emailController = TextEditingController();
  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    super.initState();
   Map argument =  widget.arguments;
   var email = argument['email'];
   print('当前的email$email');
  }

  @override
  Widget build(BuildContext context) {
    final languageModel = Provider.of<LocalModel>(context);
    return Scaffold(
        appBar: AppBar(
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10), // 垂直间距
                const LocalizedText(
                  contentKey: 'code_input',
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10), // 垂直间距
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: Provider.of<LocalModel>(context, listen: false)
                                .getText(LanguageKey.strCodeInputContent),
                            style:
                            TextStyle(fontSize: 14, color: Colors.grey[500])),
                        TextSpan(
                          text: widget.arguments['email'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                        ),
                      ],
                    )),
                const SizedBox(height: 10), // 垂直间距
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
