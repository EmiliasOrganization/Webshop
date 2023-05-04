

import 'package:flutter/material.dart';

import '../../../../constats.dart';


class ButtonList extends StatefulWidget {

  final Category? category;
  final void Function(Category) onCategorySelected;

  const ButtonList({super.key, required this.category, required this.onCategorySelected,});
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category ?? Category.EMPTY;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryButton(
          buttonName: 'Alles',
          selected: selectedCategory == Category.EMPTY,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.EMPTY ? Category.EMPTY : Category.EMPTY;
            widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Taschen',
          selected: selectedCategory == Category.BAGS,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.BAGS ? Category.EMPTY : Category.BAGS;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Kopfbedeckungen',
          selected: selectedCategory == Category.HATS,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.HATS ? Category.EMPTY : Category.HATS;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Kinder',
          selected: selectedCategory == Category.CHILDREN,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.CHILDREN ? Category.EMPTY : Category.CHILDREN;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Socken',
          selected: selectedCategory == Category.SOCKS,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.SOCKS ? Category.EMPTY : Category.SOCKS;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Kuscheltiere',
          selected: selectedCategory == Category.CUDDLY_TOYS,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.CUDDLY_TOYS ? Category.EMPTY : Category.CUDDLY_TOYS;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Handschuhe',
          selected: selectedCategory == Category.GLOVES,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.GLOVES ? Category.EMPTY : Category.GLOVES;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 20),
        CategoryButton(
          buttonName: 'Kissen & Decken',
          selected: selectedCategory == Category.CUSHIONS,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.CUSHIONS ? Category.EMPTY : Category.CUSHIONS;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
        SizedBox(height: 15),
        CategoryButton(
          buttonName: 'Rucksäcke',
          selected: selectedCategory == Category.BACKPACKS,
          onPressed: () {
            setState(() {
              selectedCategory =
              selectedCategory == Category.BACKPACKS ? Category.EMPTY: Category.BACKPACKS;
              widget.onCategorySelected(selectedCategory);
            });
          },
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onPressed;
  final String buttonName;


  const CategoryButton({
    Key? key,
    required this.selected,
    required this.onPressed,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(210, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,),
        foregroundColor: schemeColorMistyRose,
        backgroundColor: selected ? schemeColorOrange : schemeColorGreen,
      ),
      onPressed: onPressed,
      child: Text(buttonName, style: TextStyle(fontSize: 20)),
    );
  }
}

