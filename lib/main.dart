import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:provide/provide.dart';

import 'model/category.dart';
import 'provide/category_goods_list.dart';

void main() {
  var detailsInfoProvide = DetailsInfoProvide();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var childCategory = ChildCategory();
  var counter = Counter();
  var providers = Providers();

  var cartProvide = CartProvide();

  final router = FluroRouter();
  //在顶层进行的依赖,全局可用
  providers
    //有多个可以再 .. , 注册依赖
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(
        Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    return ScreenUtilInit(
        //全局类进行初始化
        designSize: Size(750, 1334),
        allowFontScaling: false,
        builder: () => Container(
              child: MaterialApp(
                title: '百姓生活+',
                debugShowCheckedModeBanner: false,
                onGenerateRoute: Application.router.generator,
                theme: ThemeData(primaryColor: Colors.pink),
                home: IndexPage(),
              ),
            ));
  }
}
