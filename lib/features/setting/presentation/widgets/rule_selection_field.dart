import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RuleSelectionField extends StatefulWidget {
  final String title;
  final bool isSelect;
  final ValueChanged<bool> onChanged;
  const RuleSelectionField(
      {super.key,
      required this.title,
      required this.isSelect,
      required this.onChanged});

  @override
  State<RuleSelectionField> createState() => _RuleSelectionFieldState();
}

class _RuleSelectionFieldState extends State<RuleSelectionField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          Checkbox(
              value: widget.isSelect,
              onChanged: (newState) {
                setState(() {
                  widget.onChanged(newState ?? false);
                });
              })
        ],
      ),
    );
  }
}
