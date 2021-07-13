# dropdown_form_field

Add the plugin:

```yaml
dependencies:
  ...
  dropdown_form_field: ^0.0.1
```

![](/screenshots/demo.gif)


```dart
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
    onChanged: (item) {},
  )
``` 
