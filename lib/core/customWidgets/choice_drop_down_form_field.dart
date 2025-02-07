import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_manager.dart';

class ChoiceDropDownFormField extends StatefulWidget {
  const ChoiceDropDownFormField({
    super.key,
    required this.items,
    required this.title,
    required this.subTitle,
    this.oldChoice,
    this.onChanged,
  });

  final List<String> items;
  final String title;
  final String subTitle;
  final String? oldChoice;
  final ValueChanged<String?>? onChanged;

  @override
  ChoiceDropDownFormFieldState createState() => ChoiceDropDownFormFieldState();
}

class ChoiceDropDownFormFieldState extends State<ChoiceDropDownFormField> {
  String? option;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: FontManager.interBold20Black),
        const SizedBox(height: 12),
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            hint: Text(widget.subTitle, style: FontManager.interSemiBold20Black.copyWith(color: ColorManager.lightGray)),
            value:(widget.oldChoice != null && widget.items.contains(widget.oldChoice)) ? widget.oldChoice : option,
            borderRadius: BorderRadius.circular(15),
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Color(0xFF064060)),
            iconSize: 30,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ColorManager.lightGray, width: 1.3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ColorManager.lightGray, width: 1.3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ColorManager.lightGray, width: 1.3),
              ),
              hintFadeDuration: const Duration(milliseconds: 1000),
            ),
            onChanged: (String? newValue) {
              setState(() {
                  option = newValue;
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue);
                  }
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select Your Choice';
              }
              return null;
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: FontManager.interBold20Black.copyWith(color: ColorManager.blackColor)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
