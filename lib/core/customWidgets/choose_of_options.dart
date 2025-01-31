import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_manager.dart';

class ChooseOfOptions extends StatefulWidget {
   ChooseOfOptions({
    super.key,
    required this.items,
    this.title,
    this.titleStyle,
    this.initialType,
    required this.onChanged, // Callback function
  });

  final List<String> items;
  final String? title;
  final TextStyle? titleStyle;
  late  String? initialType;
  final ValueChanged<String> onChanged;

  @override
  State<ChooseOfOptions> createState() => _ChooseOfOptionsState();
}

class _ChooseOfOptionsState extends State<ChooseOfOptions> {
  String? selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialType;
    print('Initial: ${widget.initialType}');
    print('Selected: $selectedType');
  }

  @override
  void didUpdateWidget(covariant ChooseOfOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialType != oldWidget.initialType) {
      setState(() {
        selectedType = widget.initialType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.title!,
                style: widget.titleStyle ?? FontManager.robotoRegular16Black,
              ),
            ],
          ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: OptionsTile(
                  title: item,
                  isSelected: selectedType == item,
                  onPressed: () {
                    print('Selected: $item');
                    print('Initial: ${widget.initialType}');
                    print('Selected: $selectedType');
                    setState(() {
                      selectedType = item;
                      widget.onChanged(selectedType!);
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class OptionsTile extends StatelessWidget {
  const OptionsTile({
    super.key,
    required this.title,
    this.onPressed,
    required this.isSelected,
  });

  final String title;
  final void Function()? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? ColorManager.blackColor : ColorManager.primaryWhiteColor,
        minimumSize: const Size(120, 43),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected
              ? BorderSide.none
              : BorderSide(width: 1.5, color: ColorManager.lightGray),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: FontManager.robotoRegular16Black.copyWith(
          color: isSelected ? ColorManager.primaryWhiteColor : ColorManager.blackColor,
        ),
      ),
    );
  }
}
