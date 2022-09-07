import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatefulWidget {
  final bool isSelected;
  double marginEnd;

  CustomIndicator({
    Key? key,
    required this.isSelected,
    this.marginEnd = 0,
  }) : super(key: key);

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: widget.marginEnd),
      child: Container(
        width: widget.isSelected ? 20.w : 7.w,
        height: 7.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
          color: widget.isSelected ? Colors.black : Colors.grey.shade300,
        ),
      ),
    );
  }
}
