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
        padding: const EdgeInsets.all(16.0),
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
                style: TextStyle(fontSize: 16)),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email to sign up for this app',
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password to sign up for this app',
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16), // 垂直间距
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    /* 处理注册逻辑 */
                  },
                  child: const Text('Sign up with email'),
                ),
                const Text('or continue with'),
                TextButton(
                  onPressed: () {
                    /* 处理Google登录逻辑 */
                  },
                  child: const Text('Google'),
                ),
              ],
            ),
            const SizedBox(height: 16), // 垂直间距
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
