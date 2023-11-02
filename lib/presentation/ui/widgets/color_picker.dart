import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key,
      required this.colors,
      required this.onSelected,
      required this.initialSelected,
      required this.totalColor});
  final List<Color> colors;
  final Function(int selectedIndex) onSelected;
  final int initialSelected;
  final int totalColor;
  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

int _selectedColorIndex = 0;

class _ColorPickerState extends State<ColorPicker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColorIndex = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.totalColor,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _selectedColorIndex = index;
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: widget.colors[index],
              child: _selectedColorIndex == index
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : null,
            ),
          );
        });
  }
}
