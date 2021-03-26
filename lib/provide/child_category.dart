//ChangeNotifier的混入是不用管理听众
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;

  ////点击大类时更换
  getChildCategory(List<BxMallSubDto> list) {
    childIndex = 0; //默认恢复 0 , 对应的索引
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
  changeChildIndex(index) {//也是应该方法
    childIndex = index;
    notifyListeners();
  }
}
