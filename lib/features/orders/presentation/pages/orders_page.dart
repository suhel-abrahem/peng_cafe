import 'package:flutter/material.dart';
import 'package:peng_cafe/core/resource/main_page/main_page.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(body: Center(child: Text("Orders Page")));
  }
}
