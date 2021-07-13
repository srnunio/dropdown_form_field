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
  String? _value;
  String? _employer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                hintBuilder: Text('Select your favorite language'),
                selectedValue: _value,
                items: ['Dart', 'Java', 'Kotlin', 'NodeJs', 'Python'],
                itemBuilder: (context, item) {
                  return Text('$item');
                },
                selectedItemBuilder: (context, item) {
                  return Text('$item');
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Language',
                  contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onChanged: (item) {
                  setState(() => _value = item);
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              DropdownFormField(
                hintBuilder: Text('Select your favorite employer'),
                selectedValue: _employer,
                items: ['Marcos', 'Ady', 'Dario', 'Luwey'],
                itemBuilder: (context, item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person_pin),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('$item')
                    ],
                  );
                },
                selectedItemBuilder: (context, item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('$item - Favorite employer')
                    ],
                  );
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
                onChanged: (item) {
                  setState(() => _employer = item);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
