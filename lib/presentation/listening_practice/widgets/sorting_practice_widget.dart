import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/widgets/custom_touchable.dart';
import 'package:phonation/presentation/widgets/large_title.dart';

class SortingPracticeWidget extends StatefulWidget {
  const SortingPracticeWidget({required this.done});

  final Function done;

  @override
  _SortingPracticeWidgetState createState() => _SortingPracticeWidgetState();
}

class _SortingPracticeWidgetState extends State<SortingPracticeWidget> {
  bool open = false;
  int selectedTypeIndex = -1;
  List<String> days = [
    "Friday",
    "Thursday",
    "Saturday",
    "Wednesday",
    "Tuesday",
    "Sunday",
    "Monday"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultListPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: LargeTitle(text: "Put the words in the correct order.")),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: surfaceColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: const EdgeInsets.all(defaultListPadding),
                      child: ReorderableListView(
                        onReorder: (int oldIndex, int newIndex) {
                          //TODO: store the new order
                        },
                        children: List.generate(
                            days.length,
                            (index) => Container(
                                key: Key('$index'),
                                height: 50,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                padding: const EdgeInsets.all(7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      days[index],
                                      maxLines: 3,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Icon(Icons.drag_handle_rounded)
                                  ],
                                ))),
                      ),
                    )),
                  ],
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTouchable(
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(defaultListPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const LargeTitle(
                            text: "You were 90% correct",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTouchable(
                            onTap: () {
                              //todo: mark the provider done
                              widget.done();
                              Navigator.of(context).pop();
                            },
                            padding: 24,
                            radius: 7,
                            child: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: mainColor,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            padding: 24,
            radius: 7,
            child: const Icon(
              Icons.check,
              color: mainColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
