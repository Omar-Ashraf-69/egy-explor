import 'package:egy_exlpor/features/search/data/constant/cons.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/custom_question_container.dart';
import 'package:flutter/material.dart';

class BuildSelectionAges extends StatefulWidget {
  const BuildSelectionAges({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<BuildSelectionAges> createState() => _BuildSelectionAgesState();
}

class _BuildSelectionAgesState extends State<BuildSelectionAges> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedAge = widget.items[index];
            setState(() {});
          },
          child: CustomQuestionContainer(
            title: widget.items[index],
            isSelected: selectedAge == widget.items[index],
          ),
        ),
      ),
    );
  }
}

class BuildSelectionList extends StatelessWidget {
  const BuildSelectionList({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onTap,
  });

  final List<String> items;
  final List<String> selectedItems;
  final Function(String p1) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onTap(items[index]),
          child: CustomQuestionContainer(
            title: items[index],
            isSelected: selectedItems.contains(items[index]),
          ),
        ),
      ),
    );
  }
}
