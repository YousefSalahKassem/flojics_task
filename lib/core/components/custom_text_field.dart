import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.hintText = '',
    this.prefixIcon,
    this.controller,
    this.inputType,
    this.maxLength,
    this.isPassword = false,
    this.validator,
    this.borderColor,
    this.suffix,
    this.borderRadius,
    this.fillColor,
    this.onSubmitted,
    this.onChanged,
    this.initalValue,
    this.maxLines,
    this.enable = true,
    super.key,
  });

  final IconData? prefixIcon;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool isPassword;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final String? Function(String? value)? onSubmitted;
  final String? Function(String? value)? onChanged;
  final Color? borderColor;
  final Widget? suffix;
  final double? borderRadius;
  final Color? fillColor;
  final String? initalValue;
  final bool enable;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  bool isRTL = false;
  String text = '';

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initalValue,
      controller: widget.controller,
      style: TextStyles.headlineLarge,
      keyboardType: widget.inputType,
      obscureText: _obscureText,
      enabled: widget.enable,
      maxLength: widget.maxLength,
      minLines: widget.maxLines,
      validator: widget.validator,
      textAlignVertical: TextAlignVertical.bottom,
      maxLines: _obscureText ? 1 : widget.maxLines,
      onChanged: (str) {
        widget.onChanged?.call(str);
        setState(() {
          text = str;
        });
      },
      onFieldSubmitted: widget.onSubmitted,
      onSaved: widget.onSubmitted,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: kVerticalSize16,horizontal: kHorizontalSize16),
        fillColor: widget.fillColor ?? AppColors.halfWhite,
        counterText: '',
        filled: true,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: 20,
                color: context.colorScheme.onBackground,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.black,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: const BorderSide(
            color: AppColors.warnColor,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                color: context.colorScheme.onBackground,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffix ?? null,
      ),
    );
  }
}
