import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppShowPhoto extends StatelessWidget {
  final Widget file;

  const AppShowPhoto({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(8.r), child: file);
  }
}
