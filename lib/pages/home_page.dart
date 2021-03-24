import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_shop/config/httpHeaders.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  void initState() {
    getHomePageContent().then((val) {
      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        //FutureBuilder 请求到数据自动渲染
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString()); //这个就是数据, map 和list的组合
              List<Map> swiperDataList = (data['data']['slides'] as List).cast(); // 顶部轮播组件数
              List<Map> navigatorList = (data['data']['category'] as List).cast(); //类别列表
              String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                  TopNavigator(navigatorList: navigatorList), //导航组件
                  AdBanner(advertesPicture: advertesPicture), //广告组件
                ],
              );
            } else {
              return Center(
                child: Text(
                  '加载中',
                ),
              );
            }
          },
        ));
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  //super 也可以不写 , 构造函数
  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('设备宽度:${ScreenUtil().screenWidth}');
    print('设备高度:${ScreenUtil().screenHeight}');
    print('设备像素密度:${ScreenUtil().pixelRatio}');
    return ScreenUtilInit(
        //上面的是老插件不能用了 , 最新的是这样写的 ,init相当于初始化设计尺寸
        designSize: Size(750, 1334),
        allowFontScaling: false,
        builder: () => Container(
              height: ScreenUtil().setHeight(333.0), //高度
              width: ScreenUtil().setWidth(750),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  //取swiperDataList 里面的 index 对象 , 里面的 image
                  return Image.network("${swiperDataList[index]['image']}", fit: BoxFit.fill);
                },
                itemCount: swiperDataList.length,
                //对于的点
                pagination: new SwiperPagination(),
                autoplay: true, //自动播放
              ),
            ));
  }
}

//gridview 导航的区域
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  //内部方法返回 widget , 单个导航栏目的item
  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //当条目大于10的时候 , 需要改变 , 太长了 ,这个不是必须的代码
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        //遍历
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;

  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(advertesPicture),
    );
  }
}
