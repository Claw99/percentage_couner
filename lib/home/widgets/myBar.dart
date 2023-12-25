import 'package:flutter/material.dart';

class CounterBar extends StatefulWidget {
  final List<Color> colors;
  final List<double> values;

  const CounterBar({
    Key? key,
    required this.colors,
    required this.values,
  }) : super(key: key);

  @override
  State<CounterBar> createState() => _CounterBarState();
}

class _CounterBarState extends State<CounterBar> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              height: 15,
              child: Row(
                children: _buildColoredContainers(
                    _controller.value, constraints.maxWidth),
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildColoredContainers(double animationValue, double maxWidth) {
    List<Widget> coloredContainers = [];

    for (int i = 0; i < widget.colors.length; i++) {
      double value = widget.values[i];
      double containerWidth = maxWidth * (value / 100);

      BorderRadius borderRadius;
      if (i == 0) {
        borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
      } else if (i == 2) {
        borderRadius = const BorderRadius.only(
            topRight: Radius.circular(10), bottomRight: Radius.circular(10));
      } else {
        borderRadius = BorderRadius.zero;
      }

      coloredContainers.add(
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: containerWidth),
          duration: Duration(milliseconds: 300),
          builder: (context, double value, child) {
            return Expanded(
              flex: value.toInt(),
              child: Container(
                width: value,
                decoration: BoxDecoration(
                  color: widget.colors[i],
                  borderRadius: borderRadius,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
            );
          },
        ),
      );
    }
    return coloredContainers;
  }
}
