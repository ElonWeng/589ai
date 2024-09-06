import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runtool/base/config/language_key.dart';
import 'package:runtool/base/model/loading_model.dart';
import 'package:runtool/base/model/local_model.dart';
import 'package:runtool/base/store/login_store.dart';
import 'package:runtool/base/widget/box_bg.dart';
import 'package:runtool/base/widget/base_page.dart';
import 'package:runtool/base/widget/local_text.dart';
import 'package:runtool/ui/login/login_model.dart';
import '../../base/config/navigator_key.dart';
import '../../base/model/time_model.dart';
import '../../base/model/toast_provider.dart';

class CodePage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const CodePage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeOneController = TextEditingController();
  final TextEditingController _codeTwoController = TextEditingController();
  final TextEditingController _codeThreeController = TextEditingController();
  final TextEditingController _codeFourController = TextEditingController();

  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    super.initState();
    context.read<TimerModel>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // var remainingTime = Provider.of<TimerModel>(context, listen: false).remainingTime;
    return Scaffold(
        appBar: AppBar(),
        body: BaseProviderWidget(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child:
              Consumer<TimerModel>(
                builder: (context, model, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10), // 垂直间距
                      const LocalizedText(
                        contentKey: LanguageKey.strCodeInput,
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
                      const SizedBox(height: 20), // 垂直间距
                      Row(
                        children: [
                          BoxBgWidget(
                            height: 50,
                            width: 50,
                            editingController: _codeOneController,
                          ),
                          const SizedBox(width: 15),
                          BoxBgWidget(
                            height: 50,
                            width: 50,
                            editingController: _codeTwoController,
                          ),
                          const SizedBox(width: 15),
                          BoxBgWidget(
                            height: 50,
                            width: 50,
                            editingController: _codeThreeController,
                          ),
                          const SizedBox(width: 15),
                          BoxBgWidget(
                            height: 50,
                            width: 50,
                            editingController: _codeFourController,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(Provider.of<LocalModel>(context, listen: false)
                                .getText(LanguageKey.strCodeGet)),
                            onTap: (){
                              if(model.remainingTime == 0){
                                context.read<LoadingModel>().show();
                                LoginStore.sendEmailCode(widget.arguments[NavigatorKey.keyEmail])
                                    .then((value) {
                                  if (value['success']) {
                                    context.read<LoadingModel>().hide();
                                    context.read<TimerModel>().startTimer();
                                  } else {
                                    context.read<LoadingModel>().hide();
                                    Provider.of<ToastProvider>(context, listen: false)
                                        .showToast(value['msg']);
                                  }
                                });
                              }else{
                                Provider.of<ToastProvider>(context, listen: false)
                                    .showToast(
                                    Provider.of<LocalModel>(context, listen: false)
                                        .getText(LanguageKey.strCodeGetWait));
                              }
                            },
                          ),
                          InkWell(
                            child:
                            Text(model.remainingTime == 0 ?
                            Provider.of<LocalModel>(context, listen: false)
                                .getText(LanguageKey.strCodeGetAgain):'${model.remainingTime}s'),
                            onTap: (){
                              if(model.remainingTime == 0){
                                context.read<LoadingModel>().show();
                                LoginStore.sendEmailCode(widget.arguments[NavigatorKey.keyEmail])
                                    .then((value) {
                                  if (value['success']) {
                                    context.read<LoadingModel>().hide();
                                    context.read<TimerModel>().startTimer();
                                  } else {
                                    context.read<LoadingModel>().hide();
                                    Provider.of<ToastProvider>(context, listen: false)
                                        .showToast(value['msg']);
                                  }
                                });
                              }
                            },
                          )
                        ],
                      )
                    ],
                  );
                },
              ),

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
