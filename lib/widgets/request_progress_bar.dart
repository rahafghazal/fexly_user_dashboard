
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';

class RequestProgressBar extends StatelessWidget {
  final int step;

  const RequestProgressBar({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(9, (index) {
        return Expanded(
          child: Container(
            height: 4,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: index < step
                  ? AppColors.primary
                  : AppColors.border,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      }),
    );
  }
}
