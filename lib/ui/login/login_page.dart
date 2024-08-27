import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runtool/base/config/config_page.dart';
import 'package:runtool/base/model/loading_model.dart';
import 'package:runtool/base/model/local_model.dart';
import 'package:runtool/base/store/login_store.dart';
import 'package:runtool/base/util/shared_preferences_util.dart';
import 'package:runtool/base/util/snackbar_util.dart';
import 'package:runtool/base/widget/local_text.dart';
import 'package:runtool/ui/login/login_model.dart';
import 'package:runtool/ui/login/privacypolicy_page.dart';
import 'package:runtool/ui/login/serviceterms_page.dart';

import '../../base/config/configs.dart';
import '../../base/util/check_util.dart';
import '../../base/widget/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageModel = Provider.of<LocalModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Image.asset(
                'assets/images/icon_internation.png',
                width: 20,
                height: 20,
              ),
              onTap: (){
                languageModel.locale = languageModel.locale.languageCode == 'en'
                    ? const Locale('zh', '') // 切换到中文
                    : const Locale('en', ''); // 切换到英文
                print('当前语言包${languageModel.locale.languageCode}');
                Configs.language = languageModel.locale.languageCode;
                SharedPreferencesUtil.setString(Configs.key_global, languageModel.locale.languageCode).then((_){

                });
              },
            )
          ],
        ), // 根据需要自定义标题
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (!CheckUtil.isRelease()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfigPage()),
                    );
                  }
                },
                child: const Text(
                  '589.AI',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50), // 垂直间距
              const LocalizedText(contentKey: 'create',textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10), // 垂直间距
              const LocalizedText(contentKey: 'emailTitle', textStyle: TextStyle(color: Colors.black, fontSize: 16)),
              const SizedBox(height: 20), // 垂直间距
              /*email输入框*/
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(
                    color: Colors.black12, // 设置边框颜色
                    width: 1, // 设置边框宽度
                  ),
                ),
                child:  Center(
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'email@domain.com',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15), // 垂直间距
              InkWell(
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: LocalizedText(contentKey: 'sighUp', textStyle: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap: () async {
                  if (loginModel.checkEmail(_emailController.text)) {
                    SnackBarService.showSnackBar(context, Provider.of<LocalModel>(context,listen: false).getText('emailValid'));
                    //获取验证码
                    context.read<LoadingModel>().show();
                    Map sendEmailCode = await LoginStore.sendEmailCode(_emailController.text);
                    if(sendEmailCode['success']){
                      context.read<LoadingModel>().hide();
                    }else{
                      context.read<LoadingModel>().hide();
                    }
                  }else{
                    SnackBarService.showSnackBar(context, Provider.of<LocalModel>(context,listen: false).getText('emailInput'));
                  }


                },
              ),
              const SizedBox(height: 20), // 垂直间距
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LocalizedText(contentKey: 'or', textStyle: TextStyle())
                ],
              ),
              const SizedBox(height: 20), // 垂直间距
              InkWell(
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.black12
                  ),
                  child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_google.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                           Text(
                            context.watch<LoginModel>().getText(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black,fontSize: 14),
                          ),
                        ],
                      )
                  ),
                ),
                onTap: (){
                  context.read<LoginModel>().setText('Loading...');
                },
              ),
              const SizedBox(height: 20), // 垂直间距
              RichText(text: TextSpan(
                children: [TextSpan(
                  text: Provider.of<LocalModel>(context,listen: false).getText('agree'),
                  style: TextStyle(fontSize: 14, color: Colors.grey[500])
                ),
                  TextSpan(
                    text: Provider.of<LocalModel>(context,listen: false).getText('service'),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.black
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // 跳转到服务条款页面的逻辑
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServiceTermsPage()),
                        );
                      },
                  ),
                  TextSpan(text: Provider.of<LocalModel>(context,listen: false).getText('and'),style: TextStyle(fontSize: 14, color: Colors.grey[500])),
                  TextSpan(
                    text: Provider.of<LocalModel>(context,listen: false).getText('privacy'),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                        color: Colors.black

                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // 跳转到隐私政策页面的逻辑
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                        );
                      },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
