import 'package:ecommerce_flutter/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class ProductChoiceChip extends StatelessWidget {
  const ProductChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? ColorsScheme.white : null),
        avatar: isColor
            ? CircularContainer(
                width: 50,
                height: 50,
                backgroundColor: HelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? CircleBorder() : null,
        backgroundColor: isColor ? HelperFunctions.getColor(text)! : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        //selectedColor: isColor ? HelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
