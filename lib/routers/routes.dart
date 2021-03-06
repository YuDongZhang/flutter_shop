
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'router_handler.dart';

class Routes{
  static String root='/';
  static String detailsPage = '/detail';
  static void configureRoutes(FluroRouter router){
    router.notFoundHandler= new Handler(//找不到路由的时候
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          print('ERROR====>ROUTE WAS NOT FONUND!!!');
        }
    );

    router.define(detailsPage,handler:detailsHandler);
  }

}