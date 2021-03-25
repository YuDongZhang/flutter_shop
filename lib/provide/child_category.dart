//ChangeNotifier的混入是不用管理听众
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];

  getChildCategory(List<BxMallSubDto> list) {
    //解决页面没有横向列表中的全部的问题
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners(); //监听的通知
  }
}
