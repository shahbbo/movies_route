import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/asset_manager.dart';
import '../../resources/color_manager.dart';

class CustomButtonOtpCode extends StatefulWidget {
  CustomButtonOtpCode({
    super.key,
    required this.otpController,
    this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
    this.isEnabled = false,
    this.onChanged,
  });

  final TextEditingController otpController;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final bool isEnabled;
  final ValueChanged<String>? onChanged;
  @override
  State<CustomButtonOtpCode> createState() => _CustomButtonOtpCodeState();
}

class _CustomButtonOtpCodeState extends State<CustomButtonOtpCode> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: TextFormField(
          controller: widget.otpController,
          focusNode: widget.focusNode,
          enabled: widget.isEnabled,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 24,
            fontFamily: ImageAssets.gothicA1,
            fontWeight: FontWeight.w400,
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            }
            return null;
          },
          textAlign: TextAlign.center,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 1, color: ColorManager.blackColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 1, color: ColorManager.blackColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 1, color: ColorManager.blackColor),
            ),
          ),
        ),
      ),
    );
  }
}
