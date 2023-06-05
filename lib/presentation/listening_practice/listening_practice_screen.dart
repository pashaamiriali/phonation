import 'package:flutter/material.dart';
import 'package:phonation/core/entities/lesson.dart';
import 'package:phonation/core/entities/listening_practice.dart';
import 'package:phonation/presentation/listening_practice/widgets/listen_to_audio_task_widget.dart';
import 'package:phonation/presentation/listening_practice/widgets/matching_practice_widget.dart';
import 'package:phonation/presentation/listening_practice/widgets/multiple_choice_practice_widget.dart';
import 'package:phonation/presentation/listening_practice/widgets/sorting_practice_widget.dart';
import 'package:phonation/presentation/listening_practice/widgets/type_select_task_widget.dart';
import 'package:phonation/presentation/provider/listening_practice_provider.dart';
import 'package:phonation/presentation/widgets/background_widget.dart';
import 'package:phonation/presentation/widgets/general_app_bar.dart';
import 'package:provider/provider.dart';

class ListeningPracticeScreen extends StatefulWidget {
  const ListeningPracticeScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  _ListeningPracticeScreenState createState() =>
      _ListeningPracticeScreenState();
}

class _ListeningPracticeScreenState extends State<ListeningPracticeScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListeningPracticeProvider>(
      //TODO: fetch the listening practices using lesson
      builder: (context, provider, _) {
        return Scaffold(
            body: SafeArea(
          child: BackgroundWidget(
            foreground: Column(
              children: [
                GeneralAppBar(appBarTitle: widget.lesson.title),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SortingPracticeWidget(done: (){
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },),
                      ListenToAudioTaskWidget(done: (){
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },),
                      TypeSelectTaskWidget(
                        selectTypeTask: SelectTypeTask(
                          "Select the right type for each option",
                          false,
                          [
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                            SelectTypeItem(
                              "something",
                              SelectTypeTaskType("correct"),
                            ),
                          ],
                          [
                            SelectTypeTaskType('one type'),
                            SelectTypeTaskType('another type'),
                          ],
                        ),
                        types: [
                          SelectTypeTaskType('one of all types'),
                          SelectTypeTaskType('another of all types'),
                        ],
                        done: () {
                          pageController.animateToPage(3,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                        },
                      ),

                      MatchingPracticeWidget(done: (){
                        pageController.animateToPage(4,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },),

                      MultipleChoicePracticeWidget(done: (){
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
