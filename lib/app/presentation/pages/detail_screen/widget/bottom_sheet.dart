import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 505,
      child: Column(
        children: [
          Text('11111')
        ],
      ),
    );
  }
}
