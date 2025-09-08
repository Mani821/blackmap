import 'package:blackmap/const/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final VoidCallback? onTap;
  final bool readOnly;
  final Function(bool)? onSuffixTap;
  final String? prefixIcon;
  final bool obSecureText;
  final bool isPasswordField;
  final ValueChanged<String>? onChanged;
  final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;

  const MyTextField(
      {super.key,
      required this.controller,
      this.hint = "Enter text",
      this.maxLines = 1,
      this.minLines = 1,
      this.keyboardType,
      this.enabled = true,
      this.onTap,
      this.readOnly = false,
      this.onSuffixTap,
      this.prefixIcon,
      this.obSecureText = false,
      this.isPasswordField = false,
      this.onChanged,
      this.capitalization = TextCapitalization.none,
      this.inputFormatters,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.validator});

  @override
  ConsumerState<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends ConsumerState<MyTextField> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(appThemeProvider.notifier).isDark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
             BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.2),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 4),
            ),
          ]
        ),
        child: TextFormField(
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          controller: widget.controller,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          style:  TextStyle(
              color: Theme.of(context).iconTheme.color, fontSize: 14, fontFamily: 'Lexend'),
          magnifierConfiguration: TextMagnifierConfiguration(
            magnifierBuilder: (_, c, magnifierInfo) => CupertinoTextMagnifier(
                magnifierInfo: magnifierInfo, controller: MagnifierController(
        
            )),
          ),
          decoration: InputDecoration(
            suffixIcon: !widget.enabled
                ? null
                : widget.isPasswordField
                    ? IconButton(
                        onPressed: () {
                          widget.onSuffixTap!(widget.obSecureText);
                        },
                        icon: Icon(
                          widget.obSecureText
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: Colors.grey[400],
                          size: 19,
                        ),
                      )
                    : widget.controller.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              widget.controller.clear();
                            },
                            icon: Icon(
                              CupertinoIcons.clear_thick_circled,
                              color: Colors.grey[500],
                              size: 20,
                            ))
                        : null,
            prefixIcon: widget.prefixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10) +
                        const EdgeInsets.only(left: 8, right: 6),
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      colorFilter: ColorFilter.mode(
                          widget.controller.text.isNotEmpty
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          BlendMode.srcIn),
                    ),
                  ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: 'Lexend',
              fontSize: 12,
            ),
            errorStyle: const TextStyle(
                color: Colors.red, fontSize: 12, fontFamily: 'Lexend'),
            isDense: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Theme.of(context).cardColor),
            ),
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Theme.of(context).cardColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Theme.of(context).cardColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          textCapitalization: widget.capitalization,
          cursorColor: Theme.of(context).primaryColor,
          cursorHeight: 14,
          obscureText: widget.obSecureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          minLines: widget.minLines,
        ),
      ),
    );
  }
}
