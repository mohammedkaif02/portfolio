import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class HeroBackground extends StatefulWidget {
  final bool isLight;

  const HeroBackground({super.key, required this.isLight});

  @override
  State<HeroBackground> createState() => _HeroBackgroundState();
}

class _HeroBackgroundState extends State<HeroBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -80 + (t * 40),
              right: -60 + (t * 30),
              child: _orb(
                size: 320,
                color: AppColors.primary.withValues(
                  alpha: widget.isLight ? 0.18 : 0.22,
                ),
              ),
            ),
            Positioned(
              bottom: -100 + (t * 50),
              left: -80 + (t * 25),
              child: _orb(
                size: 280,
                color: AppColors.secondary.withValues(
                  alpha: widget.isLight ? 0.14 : 0.18,
                ),
              ),
            ),
            Positioned(
              top: height(context) * 0.35,
              left: width(context) * 0.45 + (t * 20),
              child: _orb(
                size: 160,
                color: AppColors.accent.withValues(
                  alpha: widget.isLight ? 0.10 : 0.14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double height(BuildContext context) => MediaQuery.of(context).size.height;

  Widget _orb({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: size * 0.35,
            spreadRadius: size * 0.05,
          ),
        ],
      ),
    );
  }
}
