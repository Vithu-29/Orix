import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edged_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePrimaryHeaderContainer(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePrimaryHeaderContainer extends StatelessWidget {
  const HomePrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgedWidget(
      child: Container(
        color: ColorsScheme.primary,
        padding: EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: ColorsScheme.textWhite.withValues(
                  alpha: 0.1,
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: ColorsScheme.textWhite.withValues(
                  alpha: 0.1,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = ColorsScheme.white,
  });

  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
