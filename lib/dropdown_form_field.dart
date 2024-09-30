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

  final Function()? onTap;

  final Widget hintTitle;

  final FocusNode? focusNode;

  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final Color? dropdownColor;

  _Builder({
    required this.state,
    required this.items,
    required this.decoration,
    required this.hintTitle,
    required this.selectedValue,
    required this.builderItem,
    required this.builderSelectedItem,
    required this.iconDisabledColor,
    required this.iconEnabledColor,
    required this.dropdownColor,
    required this.onChanged,
    required this.onTap,
    required this.focusNode,
  });

  _onChanged(dynamic newValue) {
    state.didChange(newValue);
    if (onChanged == null) return;
    onChanged!(newValue);
  }

  List<DropdownMenuItem> _items(BuildContext context) {
    return items
        .map((item) => DropdownMenuItem<dynamic>(
              value: item,
              onTap: onTap,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: builderItem(context, item)),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: decoration ??
            InputDecoration(
              filled: true,
            ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<dynamic>(
            focusNode: focusNode,
            isExpanded: true,
            elevation: 4,
            iconDisabledColor: iconDisabledColor,
            iconEnabledColor: iconEnabledColor,
            dropdownColor: dropdownColor,
            hint: Container(alignment: Alignment.centerLeft, child: hintTitle),
            value: selectedValue,
            onChanged: _onChanged,
            selectedItemBuilder: (context) {
              return items
                  .map<Widget>((item) => Container(
                      alignment: Alignment.centerLeft,
                      child: builderSelectedItem(context, item)))
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
  /// Values that [itemBuilder] or [selectedItemBuilder] will use to assemble the preview of the items.
  final List<dynamic> items;

  /// Represents the selected item
  final dynamic selectedValue;

  /// Called to build children for the list with
  /// 0 <= items < items.length.
  final Widget Function(BuildContext, dynamic) itemBuilder;

  // Called to build children selected for the list with
  /// 0 <= items < items.length.
  final Widget Function(BuildContext, dynamic) selectedItemBuilder;

  /// Called when no item is selected [selectedValue]
  final Widget hintBuilder;

  /// Triggered when any [DropDownMenuItem] items are selected
  final Function(dynamic)? onChanged;

  /// Triggered when any [DropDownMenuItem] items are selected
  final Function()? onTap;

  /// Called set the style of the form
  final InputDecoration? decoration;

  /// Used to block external click events [enabled]
  final bool enabled;

  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final Color? dropdownColor;

  final FocusNode? focusNode;

  DropdownFormField({
    required this.items,
    this.selectedValue,
    this.decoration,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.dropdownColor,
    this.enabled = true,
    required this.hintBuilder,
    required this.itemBuilder,
    required this.selectedItemBuilder,
    this.onChanged,
    this.onTap,
    this.focusNode,
  }) : super(
            initialValue: selectedValue,
            enabled: enabled,
            builder: (state) => _Builder(
                  state: state,
                  items: items,
                  focusNode: focusNode,
                  hintTitle: hintBuilder,
                  decoration: decoration,
                  selectedValue: selectedValue,
                  builderItem: itemBuilder,
                  builderSelectedItem: selectedItemBuilder,
                  onChanged: onChanged,
                  onTap: onTap,
                  iconDisabledColor: iconDisabledColor,
                  iconEnabledColor: iconEnabledColor,
                  dropdownColor: dropdownColor,
                ));
}
