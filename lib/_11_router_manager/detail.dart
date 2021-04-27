import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail";

  final _message;

  DetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    // return _buildContent(context);
    // return _buildContent1(context);
    return _buildContent2(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildContent1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页 (自定义 AppBar leading)"),
        // 自定义返回按钮
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => _backToHome(context),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildContent2(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        /// 当返回为true时, 可以自动返回(flutter帮助我们执行返回操作)
        /// 当返回为false时, 自行写返回代码
        // return Future.value(true);
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("详情页 (WillPopScope)")),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_message),
          ElevatedButton(
            child: Text("回到首页"),
            onPressed: () => _backToHome(context),
          ),
        ],
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop("a detail message");
  }
}
