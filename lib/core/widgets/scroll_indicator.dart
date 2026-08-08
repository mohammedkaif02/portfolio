import 'package:flutter/material.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';

class ScrollIndicator extends StatefulWidget {
  final VoidCallback onTap;

  const ScrollIndicator({super.key, required this.onTap});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounce;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _bounce = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _bounce,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _bounce.value),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Scroll to explore',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary.withValues(alpha: 0.75),
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 6),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primary.withValues(alpha: 0.85),
                  size: 28,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
