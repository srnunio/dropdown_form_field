import 'package:dropdown_form_field/dropdown_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownFormField(
                hintBuilder: Text('Select your item'),
                items: ['Dart', 'Flutter'],
                itemBuilder: (context, item) {
                  return Text('$item');
                },
                selectedItemBuilder: (context, item) {
                  return Text('$item');
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
