import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/listening_practice/widgets/listen_to_audio_task_widget.dart';
import 'package:phonation/presentation/widgets/body_text.dart';
import 'package:phonation/presentation/widgets/custom_touchable.dart';
import 'package:phonation/presentation/widgets/large_title.dart';

import '../../widgets/question_text.dart';

class MultipleChoicePracticeWidget extends StatefulWidget {
  const MultipleChoicePracticeWidget({super.key, required this.done});

  final Function done;

  @override
  _MultipleChoicePracticeWidgetState createState() =>
      _MultipleChoicePracticeWidgetState();
}

class _MultipleChoicePracticeWidgetState
    extends State<MultipleChoicePracticeWidget> {
  int selectedTypeIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: const EdgeInsets.all(defaultListPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: LargeTitle(text: "do this ")),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: surfaceColor,
              ),
              child: Column(
                children: [
                  const Align(alignment: Alignment.centerLeft, child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: QuestionText(
                      text: 'This is the question that you have to answer',),
                  )),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: mainColor,
                          style: BorderStyle.solid,
                          width: 1,
                        )), padding: EdgeInsets.all(15),
                    child: Column(
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomTouchable(
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
                            child: Row(
                              children: [
                                Text(
                                  "Choice",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: selectedTypeIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          SizedBox(height: 20,),
          BodyText(text: "Question 1 of 6"),
          SizedBox(height: 10,),
          CustomProgressIndicator(width: width/3, progress: 1 / 6),
          SizedBox(height: 20,),
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
