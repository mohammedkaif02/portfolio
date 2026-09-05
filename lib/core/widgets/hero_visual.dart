import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class HeroVisual extends StatefulWidget {
  final double size;

  const HeroVisual({super.key, this.size = 360});

  @override
  State<HeroVisual> createState() => _HeroVisualState();
}

class _HeroVisualState extends State<HeroVisual> with TickerProviderStateMixin {
  late AnimationController _orbitController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  static const _techIcons = [
    {'icon': AppAssets.flutter, 'label': 'Flutter'},
    {'icon': AppAssets.dart, 'label': 'Dart'},
    {'icon': AppAssets.getx, 'label': 'GetX'},
    {'icon': AppAssets.firebase, 'label': 'Firebase'},
    {'icon': AppAssets.figma, 'label': 'Figma'},
    {'icon': AppAssets.github, 'label': 'GitHub'},
  ];

  @override
  void initState() {
    super.initState();
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _orbitController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: Listenable.merge([_orbitController, _pulseController]),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Ambient Outer Glow Aura Ring
              Transform.scale(
                scale: _pulseAnim.value,
                child: Container(
                  width: widget.size * 0.82,
                  height: widget.size * 0.82,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.45),
                        AppColors.secondary.withValues(alpha: 0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 0.65, 1.0],
                    ),
                  ),
                ),
              ),

              // Orbit Track Dashed Circular Line
              Container(
                width: widget.size * 0.80,
                height: widget.size * 0.80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    width: 1.5,
                  ),
                ),
              ),

              // Center Brand Monogram Avatar Badge (Pure vector, zero white background artifacts)
              _CenterMonogramBadge(size: widget.size * 0.54),

              // Orbiting Tech Bubbles
              ...List.generate(_techIcons.length, (index) {
                final angle =
                    (_orbitController.value * 2 * math.pi) +
                    (index * (2 * math.pi / _techIcons.length));
                final radius = widget.size * 0.40;
                return Transform.translate(
                  offset: Offset(
                    math.cos(angle) * radius,
                    math.sin(angle) * radius,
                  ),
                  child: _TechBubble(
                    iconPath: _techIcons[index]['icon']!,
                    label: _techIcons[index]['label']!,
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

class _TechBubble extends StatefulWidget {
  final String iconPath;
  final String label;

  const _TechBubble({required this.iconPath, required this.label});

  @override
  State<_TechBubble> createState() => _TechBubbleState();
}

class _TechBubbleState extends State<_TechBubble> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.25 : 1.0,
        duration: const Duration(milliseconds: 180),
        child: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1F2937),
            border: Border.all(
              color: _isHovered ? AppColors.primary : Colors.white24,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    _isHovered
                        ? AppColors.primary.withValues(alpha: 0.6)
                        : AppColors.primary.withValues(alpha: 0.25),
                blurRadius: _isHovered ? 16 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(widget.iconPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _CenterMonogramBadge extends StatelessWidget {
  final double size;

  const _CenterMonogramBadge({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFFC084FC), Color(0xFF7241EA), Color(0xFF38BDF8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7241EA).withValues(alpha: 0.55),
            blurRadius: 30,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Color(0xFF1E1B4B), Color(0xFF0F172A)],
            center: Alignment(-0.2, -0.3),
            radius: 0.85,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Inner glowing accent ring
            Container(
              width: size * 0.78,
              height: size * 0.78,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFC084FC).withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
            ),
            // MK Gradient Monogram + Tag
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback:
                      (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFFE9D5FF),
                          Color(0xFFC084FC),
                          Color(0xFF38BDF8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                  child: const Text(
                    "MK",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7241EA).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFC084FC).withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.code_rounded,
                        color: Color(0xFFC084FC),
                        size: 13,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "FLUTTER",
                        style: TextStyle(
                          color: Color(0xFFE9D5FF),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
