import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReuseableTextForm extends StatefulWidget {
  final String? title;
  final String hintText;
  final bool showHideButton;
  final TextEditingController? controller;
  final String? Function(String? val)? validator;
  final TextInputType? textInputType;
  const ReuseableTextForm({
    super.key,
    this.title,
    required this.hintText,
    this.showHideButton = false,
    this.controller,
    this.validator,
    this.textInputType,
  });

  @override
  State<ReuseableTextForm> createState() => _ReuseableTextFormState();
}

class _ReuseableTextFormState extends State<ReuseableTextForm> {
  bool _isHidden = true;
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? ReuseableText(widget.title!)
              : const SizedBox(),
          SizedBox(
            height: 6,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: widget.textInputType,
                    controller: widget.controller,
                    focusNode: focus,
                    validator: widget.validator,
                    obscureText: widget.showHideButton && _isHidden,
                    onTapOutside: (_) => focus.unfocus(),
                    style: GoogleFonts.lato(fontSize: 14),
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: GoogleFonts.lato(fontSize: 14),
                      contentPadding: EdgeInsets.only(left: 16),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.showHideButton,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                    icon: FaIcon(
                      _isHidden
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 18,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
