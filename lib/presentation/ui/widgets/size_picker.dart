import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  SizePicker(
      {super.key,
      required this.sizes,
      required this.onSelected,
      required this.initialSelected});
  final List<String> sizes;
  final Function(int selectedIndex) onSelected;
  final int initialSelected;
  @override
  State<SizePicker> createState() => _SiezPickerState();
}

int _selectedSizesIndex = 0;

class _SiezPickerState extends State<SizePicker> {
  @override
  void initState() {
    _selectedSizesIndex = widget.initialSelected;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                _selectedSizesIndex = index;
                widget.onSelected(index);
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                  color: _selectedSizesIndex == index
                      ? AppColor.primaryColor
                      : Colors.white,
                ),
                padding: EdgeInsets.all(6),
                child: Text(
                  widget.sizes[index],
                  style: TextStyle(
                      color: _selectedSizesIndex == index
                          ? Colors.white
                          : Colors.black),
                ),
              ));
        });
  }
}
