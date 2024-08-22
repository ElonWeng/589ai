// 示例的隐私政策页面
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();

}

class _ConfigPageState extends State<ConfigPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('环境配置'),
      ),
      body: Column(
        children: [

        ],
      )
    );
  }

}