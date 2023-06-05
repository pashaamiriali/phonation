import 'package:flutter/material.dart';
import 'package:phonation/core/entities/lesson.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/lessons_screen/widgets/lesson_options_widget.dart';
import 'package:phonation/presentation/listening_practice/listening_practice_screen.dart';
import 'package:phonation/presentation/pronunciation_practice_screen/pronunciation_practice_screen.dart';
import 'package:phonation/presentation/provider/pronunciation_practice_provider.dart';
import 'package:phonation/presentation/widgets/list_item_title.dart';
import 'package:phonation/services/fetch_pronunciation_practice_for_lesson_service.dart';
import 'package:provider/provider.dart';

class LessonListItem extends StatefulWidget {
  const LessonListItem({
    super.key,
    required this.itemNumber,
    required this.lesson,
  });

  final int itemNumber;
  final Lesson lesson;

  @override
  State<LessonListItem> createState() => _LessonListItemState();
}

class _LessonListItemState extends State<LessonListItem> {
  bool showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Column(
            children: [
              Material(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  splashColor: Colors.deepPurple,
                  highlightColor: surfaceColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      showOptions = !showOptions;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: ListItemTitle(text: widget.lesson.title),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            showOptions
                                ? Icons.keyboard_double_arrow_up
                                : Icons.keyboard_double_arrow_down,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              showOptions ? buildOptions(context) : Container()
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                const Image(
                  image: AssetImage('assets/img/list_number_background.png'),
                  width: 53,
                  height: 55,
                ),
                Positioned(
                    left: 25,
                    top: 12,
                    child: ListItemTitle(
                      text: widget.itemNumber.toString(),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LessonOptionsWidget(
              optionNameTitle: 'Pronunciation',
              onTap: () {
                fetchPronunciationPracticeForLessonService(
                    Provider.of<PronunciationPracticeProvider>(context,
                        listen: false),
                    widget.lesson.id);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PronunciationPracticeScreen(lesson: widget.lesson)));
              },
              optionIcon: Icons.mic),
          const SizedBox(
            width: 14,
          ),
          LessonOptionsWidget(
              optionNameTitle: 'Listening',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListeningPracticeScreen(lesson: widget.lesson)));
              },
              optionIcon: Icons.headphones),
        ],
      ),
    );
  }
}
