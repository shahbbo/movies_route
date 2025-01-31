import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_manager.dart';

class ChoiceDropDownMenu extends StatefulWidget {
  const ChoiceDropDownMenu({
    super.key,
    required this.items,
    required this.title,
    required this.subTitle,
    this.oldChoice,
  });

  final List<String> items;
  final String title;
  final String subTitle;
  final String? oldChoice;
  @override
  ChoiceDropDownMenuState createState() => ChoiceDropDownMenuState();
}
class ChoiceDropDownMenuState extends State<ChoiceDropDownMenu> {
  String? option;
  @override
  void initState() {
    super.initState();
    option = widget.oldChoice ;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: FontManager.interBold20Black),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorManager.lightGray, width: 1.3),
          ),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(widget.subTitle, style: FontManager.interSemiBold20Black.copyWith(color: ColorManager.lightGray)),
              alignment: Alignment.centerLeft,
              value: option,
              borderRadius: BorderRadius.circular(15),
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              icon: Transform.rotate(
                angle: -1.5707,
                child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF064060)),
              ),
              iconSize: 20,
              underline: Container(
                height: 0,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  option = newValue;
                });
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value , style: FontManager.interBold20Black.copyWith(color: ColorManager.blackColor)),
                );
              }).toList(),
              selectedItemBuilder: (BuildContext context) {
                return widget.items.map<Widget>((String value) {
                  return IntrinsicWidth(
                    child: Row(
                      children: [
                        Text(value, style: FontManager.interBold20Black.copyWith(color: ColorManager.blackColor)),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }
}

