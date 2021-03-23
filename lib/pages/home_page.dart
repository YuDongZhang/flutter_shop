import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController typeController = TextEditingController();
  String showText = '欢迎你来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('美好人间'),
          ),
          body: Container(
            height: 1000,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,//控制器得到文本框的值
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '美女类型',
                      helperText: '请输入你喜欢的类型'),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: _choiceAction,//点击的时候执行这个方法
                  child: Text('选择完毕'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )),
    );
  }

  void _choiceAction(){
    print('开始选择你喜欢的类型............');
    if(typeController.text.toString()==''){
      showDialog(
          context: context,
          builder: (context)=>AlertDialog(title:Text('美女类型不能为空'))
      );
    }else{
      //then 处理flutter里面的值 , val 即为获得的值, reture 值
      getHttp(typeController.text.toString()).then((val){
        setState(() {//最后还是通过setstate 修改的值
          //map类型来取数据
          showText=val['data']['name'].toString();
        });
      });
    }

  }

  Future getHttp(String TypeText)async{
    try{
      Response response;
      //typetext 即为上面传的参数
      var data={'name':TypeText};
      response = await Dio().get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
          queryParameters:data//这是一种新的带参数的方式
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }
}
