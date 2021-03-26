import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/details.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

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
