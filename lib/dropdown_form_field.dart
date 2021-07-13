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

  final bool enabled;

  _Builder(
      {required this.state,
      required this.items,
      required this.decoration,
      required this.hintTitle,
      this.enabled = true,
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

/// Creates a [DropdownFormField]
class DropdownFormField extends FormField<dynamic> {
  /// Values that [builderItem] or [builderSelectedItem] will use to assemble the preview of the items.
  final List<dynamic> items;

  /// Represents the selected item
  final dynamic selectedValue;

  /// Called to build children for the list with
  /// 0 <= items < items.length.
  final Widget Function(BuildContext, dynamic) builderItem;

  // Called to build children selected for the list with
  /// 0 <= items < items.length.
  final Widget Function(BuildContext, dynamic) builderSelectedItem;

  /// Called when no item is selected [selectedValue]
  final Widget hintTitle;

  /// Triggered when any [DropDownMenuItem] items are selected
  final Function(dynamic)? onChanged;

  /// Called set the style of the form
  final InputDecoration? decoration;

  /// Used to block external click events [enabled]
  final bool enabled;

  DropdownFormField(
      {required this.items,
      this.selectedValue,
      this.decoration,
      this.enabled = true,
      required this.hintTitle,
      required this.builderItem,
      required this.builderSelectedItem,
      this.onChanged})
      : super(
            initialValue: selectedValue,
            enabled: enabled,
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
