import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''), // 根据需要自定义标题
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              '589.AI',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50), // 垂直间距
            const Text('Create an account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10), // 垂直间距
            const Text('Enter your email to sign up for this app',
                style: TextStyle(color: Colors.black, fontSize: 16)),
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
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
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
                  child: Text('Sign up with email',style: TextStyle(color: Colors.white),),
                ),
              ),
              onTap: (){
                print('注册');
              },
            ),
            const SizedBox(height: 20), // 垂直间距
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('or continue with'),
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
                      const Text(
                      'Google',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 14),
                    ),
                  ],
                  )
                ),
              ),
              onTap: (){
                print('注册');
              },
            ),
            const SizedBox(height: 20), // 垂直间距
            Text(
              'By clicking continue, you agree to our Terms of Service, and Privacy Policy.',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
