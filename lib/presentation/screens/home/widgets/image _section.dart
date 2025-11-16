import 'package:flutter/material.dart';
import '../../../../core/color/colors.dart';
import 'gradiant_widget.dart';

class StylishBackground extends StatelessWidget {
  const StylishBackground({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 3,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Transform.rotate(
                  angle: 3.14,
                  child: GradiantWidget(
                    child: Icon(Icons.chevron_right, color: secondaryColor, size: 80),
                  ),
                ),
              ),
              GlowingRing(isMobile: isMobile),
              Align(
                alignment: Alignment.bottomRight,
                child: GradiantWidget(
                  child: Icon(Icons.chevron_right_outlined, color: secondaryColor, size: 80),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GlowingRing extends StatefulWidget {
  const GlowingRing({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  State<GlowingRing> createState() => _GlowingRingState();
}

class _GlowingRingState extends State<GlowingRing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final glow = 20 + (_controller.value * 30);

        return Container(
          width: widget.isMobile ? size.width / 3 : size.width / 6,
          height: widget.isMobile ? size.height / 1.5 : size.height / 3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: pinkpurple,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF00CC).withValues(alpha: 0.6),
                blurRadius: glow,
                spreadRadius: glow / 5,
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(10), // thickness of the ring
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withValues(alpha: .6),
              image: DecorationImage(
                image: AssetImage('assets/imgs/IMG_20230620_213445_759.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
