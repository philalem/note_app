import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Noted',
      home: MyHomePage(title: 'Create a note'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
        border: Border(bottom: BorderSide(color: Colors.transparent)),
        backgroundColor: Colors.transparent,
        trailing: CupertinoButton(
          onPressed: () {
            !focusNode.hasFocus
                ? SystemChannels.textInput.invokeMethod('TextInput.hide')
                : focusNode.unfocus();
          },
          padding: EdgeInsets.all(0.0),
          child: Text(
            'Done',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => focusNode.requestFocus(),
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: CupertinoTextField(
                        autofocus: true,
                        focusNode: focusNode,
                        onTap: () => focusNode.requestFocus(),
                        maxLines: null,
                        decoration: BoxDecoration(color: Colors.transparent),
                        textCapitalization: TextCapitalization.sentences,
                        placeholder: "Write something...",
                        style: TextStyle(color: Colors.black),
                        placeholderStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            textEditingRow()
          ],
        ),
      ),
    );
  }

  Container textEditingRow() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: CupertinoButton(
              onPressed: () => print('pressed B'),
              color: Colors.grey[200],
              padding: EdgeInsets.all(0),
              child: Text(
                'B',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: CupertinoButton(
              onPressed: () => print('pressed I'),
              padding: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: Text(
                'I',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: CupertinoButton(
              onPressed: () => print('pressed U'),
              padding: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: Text(
                'U',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: CupertinoButton(
              onPressed: () => print('pressed A^'),
              padding: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: Text(
                'A^',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: CupertinoButton(
              onPressed: () => print('pressed a^'),
              padding: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: Text(
                'a^',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
