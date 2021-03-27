import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/details.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;
  //详情页的下面有一个 详情和评价
  bool isLeft = true;
  bool isRight = false;

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
    notifyListeners();

  }

  //从后台获取商品信息
  getGoodsInfo(String id) {
    var formData = {
      'goodId': id,
    };

    request('getGoodDetailById', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);

      notifyListeners();
    });
  }
}
