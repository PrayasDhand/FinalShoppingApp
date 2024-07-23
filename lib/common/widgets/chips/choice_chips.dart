import 'package:flutter/material.dart';
import 'package:pkart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, required this.text, required this.selected, this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function (bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: THelperFunctions.getColor(text) != null ? const SizedBox() :  Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: selected ? Colors.white: null),
        avatar: THelperFunctions.getColor(text) != null ? TCircularContainer(width: 50,height: 50, backgroundColor: THelperFunctions.getColor(text)!,) : null,
        shape: THelperFunctions.getColor(text) != null ? const CircleBorder() : null,
        labelPadding: THelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        padding: THelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        selectedColor:THelperFunctions.getColor(text) ,
        backgroundColor: THelperFunctions.getColor(text),
      ),
    );
  }
}