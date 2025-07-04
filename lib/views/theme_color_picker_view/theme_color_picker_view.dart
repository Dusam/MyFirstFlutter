import 'package:flutter/material.dart';
import 'package:my_first_flutter/globals/colors.dart';

final List<Color> themeColors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.purple,
  mainThemeColor,
  Colors.teal,
  Colors.pink,
];

class ThemePickerView extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ThemePickerView({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 6,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: themeColors.map((color) {
        final isSelected = color == selectedColor;

        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(
                      color: const Color.fromARGB(255, 71, 71, 71),
                      width: 5,
                    )
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}
