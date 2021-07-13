library dropdown_form_field;

import 'package:flutter/material.dart';

class _Builder extends StatelessWidget {
  final FormFieldState<dynamic> state;
  final List<dynamic> items;
  final dynamic selectedValue;
  final InputDecoration? decoration;
  final Widget Function(BuildContext, dynamic) builderItem;
  final Widget Function(BuildContext, dynamic) builderSelectedItem;
  final Function(dynamic)? onChanged;
  final Widget hintTitle;

  _Builder(
      {required this.state,
      required this.items,
      required this.decoration,
      required this.hintTitle,
      required this.selectedValue,
      required this.builderItem,
      required this.builderSelectedItem,
      required this.onChanged});

  _onChanged(dynamic newValue) {
    state.didChange(newValue);
    if (onChanged == null) return;
    onChanged!(newValue);
  }

  List<DropdownMenuItem> _items(BuildContext context) {
    return items
        .map((item) => DropdownMenuItem<dynamic>(
              value: item,
              child: builderItem(context, item),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: decoration ?? InputDecoration(),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<dynamic>(
            isExpanded: true,
            hint: hintTitle,
            value: selectedValue,
            onChanged: _onChanged,
            selectedItemBuilder: (context) {
              return items
                  .map<Widget>((item) => builderItem(context, item))
                  .toList();
            },
            items: _items(context),
          ),
        ),
      ),
    );
  }
}

class DropdownFormField extends FormField<dynamic> {
  final List<dynamic> items;
  final dynamic selectedValue;
  final Widget Function(BuildContext, dynamic) builderItem;
  final Widget Function(BuildContext, dynamic) builderSelectedItem;
  final Widget hintTitle;
  final Function(dynamic)? onChanged;
  final InputDecoration? decoration;

  DropdownFormField(
      {required this.items,
      this.selectedValue,
      this.decoration,
      required this.hintTitle,
      required this.builderItem,
      required this.builderSelectedItem,
      this.onChanged})
      : super(
            initialValue: selectedValue,
            builder: (state) => _Builder(
                state: state,
                items: items,
                hintTitle: hintTitle,
                decoration: decoration,
                selectedValue: selectedValue,
                builderItem: builderItem,
                builderSelectedItem: builderSelectedItem,
                onChanged: onChanged));
}
