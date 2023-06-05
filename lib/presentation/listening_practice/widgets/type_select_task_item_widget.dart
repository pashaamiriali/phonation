import 'package:flutter/material.dart';
import 'package:phonation/core/entities/listening_practice.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/widgets/custom_touchable.dart';

class TypeSelectTaskItemWidget extends StatefulWidget {
  const TypeSelectTaskItemWidget({
    super.key,
    required this.item,
    required this.types,
    required this.onTypeSelected,
  });

  final SelectTypeItem item;
  final List<SelectTypeTaskType> types;
  final Function onTypeSelected;

  @override
  State<TypeSelectTaskItemWidget> createState() =>
      _TypeSelectTaskItemWidgetState();
}

class _TypeSelectTaskItemWidgetState extends State<TypeSelectTaskItemWidget> {
  bool open = false;
  int selectedTypeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          open = !open;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border:
              Border.all(color: mainColor, width: 1, style: BorderStyle.solid),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.title,
                  style: const TextStyle(fontSize: 14),
                ),
                Row(
                  children: [
                    const Text(
                      "SelectType",
                      style: TextStyle(color: mainColor, fontSize: 14),
                    ),
                    Icon(
                      open
                          ? Icons.keyboard_double_arrow_up
                          : Icons.keyboard_double_arrow_down,
                      color: mainColor,
                    ),
                  ],
                ),
              ],
            ),
            open
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: List.generate(widget.types.length, (index) {
                        return CustomTouchable(
                          onTap: () {
                            //todo notify the parent
                            setState(() {
                              selectedTypeIndex = index;
                            });
                          },
                          surface: selectedTypeIndex == index
                              ? mainColor
                              : Colors.white,
                          padding: 7,
                          radius: 7,
                          child: Text(
                            widget.types[index].title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: selectedTypeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
