import 'dart:async';

import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration pauseDuration;
  final Duration deletingSpeed;
  final TextAlign textAlign;

  const TypingText({
    super.key,
    required this.texts,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 75),
    this.pauseDuration = const Duration(milliseconds: 2200),
    this.deletingSpeed = const Duration(milliseconds: 35),
    this.textAlign = TextAlign.center,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    _tick();
  }

  void _tick() {
    if (!mounted || widget.texts.isEmpty) return;

    final currentText = widget.texts[_textIndex];

    if (!_isDeleting) {
      if (_charIndex <= currentText.length) {
        setState(() {
          _displayText = currentText.substring(0, _charIndex);
        });
        if (_charIndex == currentText.length) {
          _timer = Timer(widget.pauseDuration, () {
            if (mounted) {
              setState(() => _isDeleting = true);
              _tick();
            }
          });
          return;
        }
        _charIndex++;
        _timer = Timer(widget.typingSpeed, _tick);
      }
    } else {
      if (_charIndex > 0) {
        _charIndex--;
        setState(() {
          _displayText = currentText.substring(0, _charIndex);
        });
        _timer = Timer(widget.deletingSpeed, _tick);
      } else {
        _isDeleting = false;
        _textIndex = (_textIndex + 1) % widget.texts.length;
        _timer = Timer(const Duration(milliseconds: 350), _tick);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = widget.style?.fontSize ?? 18;
    final color = widget.style?.color ?? Colors.white;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            _displayText,
            style: widget.style,
            textAlign: widget.textAlign,
          ),
        ),
        _BlinkingCursor(color: color, height: fontSize * 1.15),
      ],
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  final Color color;
  final double height;

  const _BlinkingCursor({required this.color, required this.height});

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 530),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 2.5,
        height: widget.height,
        margin: const EdgeInsets.only(left: 3),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
