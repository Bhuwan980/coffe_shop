import 'package:flutter/material.dart';

class FocusManagerWidget extends StatelessWidget {
  final Widget child;

  const FocusManagerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
