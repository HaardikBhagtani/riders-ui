import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class CustomMultiSelectDropdown extends StatefulWidget {
  CustomMultiSelectDropdown(
      {Key? key, required this.label, required this.selectedValues, required this.dropdownList, this.isRadioInputType, required this.handleOnChange, required this.errorText})
      : super(key: key);

  String label;
  List<String> selectedValues;
  List<String> dropdownList;
  Function(List<String>) handleOnChange;
  bool? isRadioInputType;
  String? errorText;

  @override
  State<CustomMultiSelectDropdown> createState() => _CustomMultiSelectDropdownState();
}

class _CustomMultiSelectDropdownState extends State<CustomMultiSelectDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.label,
              style: const TextStyle(
                fontSize: 16,
              ),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 20),
          child: DropDownMultiSelect(
                  options: widget.dropdownList,
                  selectedValues: widget.selectedValues,
                  onChanged: (values) => widget.handleOnChange(values),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    errorText: widget.errorText,
                  ),
                ),
        )
      ],
    );
  }
}
