import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/extension/int_extension.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;

  OperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      width: 110.px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 3.px),
          Text(_title, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
