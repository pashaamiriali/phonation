import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/home_screen/widgets/level_widget.dart';
import 'package:phonation/presentation/lessons_screen/lessons_screen.dart';
import 'package:phonation/presentation/provider/home_provider.dart';
import 'package:phonation/presentation/provider/lessons_provider.dart';
import 'package:phonation/presentation/widgets/large_title.dart';
import 'package:phonation/services/fetch_all_levels_service.dart';
import 'package:provider/provider.dart';

class LessonsWidget extends StatefulWidget {
  const LessonsWidget({
    super.key,
  });

  @override
  State<LessonsWidget> createState() => _LessonsWidgetState();
}

class _LessonsWidgetState extends State<LessonsWidget> {
  bool showLevels = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                showLevels = !showLevels;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: Center(
                      child: LargeTitle(text: "Lessons"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      showLevels
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
        showLevels ? buildLevels(context) : Container()
      ],
    );
  }

  Widget buildLevels(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      if (provider.levels.isEmpty) {
        fetchAllLevelsService(provider);
      }

      return provider.isLoading
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Wrap(
                  spacing: 18,
                  runSpacing: 8,
                  children: List.generate(
                    provider.levels.length,
                    (index) => LevelWidget(
                      levelTitle: provider.levels[index].title,
                      onTap: () {
                        Provider.of<LessonProvider>(context,listen: false).updateLessons([]);
                        //TODO: using the level id, open the lessons list
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) =>
                                LessonsScreen(level: provider.levels[index]),
                          ),
                        );
                      },
                    ),
                  )),
            );
    });
  }
}
