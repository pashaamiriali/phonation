import 'package:flutter/material.dart';
import 'package:phonation/core/entities/listening_practice.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/listening_practice/widgets/type_select_task_item_widget.dart';
import 'package:phonation/presentation/widgets/custom_touchable.dart';
import 'package:phonation/presentation/widgets/large_title.dart';

class TypeSelectTaskWidget extends StatefulWidget {
  final SelectTypeTask selectTypeTask;
  final List<SelectTypeTaskType> types;
  final Function done;
  const TypeSelectTaskWidget(
      {super.key, required this.selectTypeTask, required this.types, required this.done});

  @override
  _TypeSelectTaskWidgetState createState() => _TypeSelectTaskWidgetState();
}

class _TypeSelectTaskWidgetState extends State<TypeSelectTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultListPadding),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: LargeTitle(
              text: widget.selectTypeTask.instruction,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultListPadding),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(widget.selectTypeTask.items.length,
                      (index) {
                    SelectTypeItem item = widget.selectTypeTask.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TypeSelectTaskItemWidget(
                        item: item,
                        types: widget.types,
                        onTypeSelected: () {
                          //todo: notify the parent
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
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
                      ),padding: const EdgeInsets.all(defaultListPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const LargeTitle(
                            text: "You were 90% correct",
                          ),
                          const SizedBox(height: 15,),
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  }

