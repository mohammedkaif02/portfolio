import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/features/home/presentation/controllers/navigation_controller.dart';

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final int delayMs;
  final Duration duration;
  final Offset offset;

  const ScrollReveal({
    super.key,
    required this.child,
    this.delayMs = 0,
    this.duration = const Duration(milliseconds: 600),
    this.offset = const Offset(0.0, 35.0),
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  bool _isRevealed = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    );

    _slideAnim = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(_fadeAnim);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
      _subscribeToScroll();
    });
  }

  void _subscribeToScroll() {
    try {
      final navCtrl = Get.find<NavigationController>();
      navCtrl.scrollController.addListener(_checkVisibility);
    } catch (_) {
      // Fallback if NavigationController is not found
    }
  }

  void _checkVisibility() {
    if (!mounted || _isRevealed) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    // Trigger animation when top of element enters lower 90% of screen
    if (position.dy < screenHeight * 0.92) {
      _isRevealed = true;
      if (widget.delayMs > 0) {
        _timer = Timer(Duration(milliseconds: widget.delayMs), () {
          if (mounted) {
            _animController.forward();
          }
        });
      } else {
        _animController.forward();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    try {
      if (Get.isRegistered<NavigationController>()) {
        final navCtrl = Get.find<NavigationController>();
        navCtrl.scrollController.removeListener(_checkVisibility);
      }
    } catch (_) {}
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnim.value,
          child: Transform.translate(
            offset: _slideAnim.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
