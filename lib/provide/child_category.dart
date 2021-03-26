//ChangeNotifier的混入是不用管理听众
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;
  String categoryId = '4'; //说明点击右上切换右下需要左边的大类的id
  String subId = ''; //小类ID ,右上

  ////点击大类时更换
  getChildCategory(List<BxMallSubDto> list, String id) {
    categoryId = id;
    childIndex = 0; //默认恢复 0 , 对应的索引
    subId = ''; //点击大类时，把子类ID清空
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

  //改变子类索引
  changeChildIndex(int index, String id) {
    //也是应该方法
    childIndex = index;
    subId = id;
    notifyListeners();
  }
}
