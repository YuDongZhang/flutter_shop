import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';//这个是苹果的风格

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: '分类'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),label: '购物车'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: '会员中心'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

