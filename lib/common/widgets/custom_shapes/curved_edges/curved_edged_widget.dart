import 'package:ecommerce_flutter/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class CurvedEdgedWidget extends StatelessWidget {
  const CurvedEdgedWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CurvedEdges(), child: child);
  }
}