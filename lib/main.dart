import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:provide/provide.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  //在顶层进行的依赖,全局可用
  providers
    //有多个可以再 .. , 注册依赖
    ..provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}
