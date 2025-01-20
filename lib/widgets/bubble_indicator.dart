import 'package:flutter/material.dart';

class BubbleIndicator extends StatelessWidget {
  final int totalBubbles;
  final int activeIndex;
  final MainAxisAlignment alignment; // Externally configurable alignment

  const BubbleIndicator({
    super.key,
    required this.totalBubbles,
    required this.activeIndex,
    this.alignment = MainAxisAlignment.center, // Default to center
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment, // Use the externally provided alignment
      children: List.generate(totalBubbles, (index) {
        bool isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: isActive ? 24.0 : 12.0, // Active bubble is wider
          height: 12.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey,
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
      }),
    );
  }
}
