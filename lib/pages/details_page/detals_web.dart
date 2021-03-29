import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<DetailsInfoProvide>(context)
        .goodsInfo
        .data
        .goodInfo
        .goodsDetail;
    return Container(
      child: Html(data: goodsDetail), //链接
    );
  }
}
