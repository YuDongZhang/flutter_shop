import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_shop/config/service_url.dart';

//这个相当于我们的 retrofit 类 , 单独接口放到一起 , 还是和原始的 方法有点像
Future getHomePageContent() async {
  try {
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    //表单的形式
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    //传递参数 经纬度 , 模拟定位
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    //map类型 , homepage读取数据的方式 , 还有你传递的参数
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//获得火爆专区商品的方法
Future getHomePageBeloConten() async {
  try {
    print('开始获取下拉列表数据.................');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//上面的接口相似 , 综合起来  getHomePageBeloConten  getHomePageContent
Future request(url, formData) async {
  try {
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    if (formData == null) {//判断是否传递参数
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
