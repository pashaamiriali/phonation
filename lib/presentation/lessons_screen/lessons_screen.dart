import 'package:flutter/material.dart';
import 'package:phonation/core/entities/level.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/widgets/general_app_bar.dart';
import 'package:phonation/presentation/lessons_screen/widgets/lessons_list_item.dart';
import 'package:phonation/presentation/provider/lessons_provider.dart';
import 'package:phonation/presentation/widgets/background_widget.dart';
import 'package:phonation/services/fetch_lessons_for_level_service.dart';
import 'package:provider/provider.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({Key? key, required this.level}) : super(key: key);
  final Level level;

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        foreground: Column(
          children: [
            GeneralAppBar(
              appBarTitle: widget.level.title,
            ),
            Consumer<LessonProvider>(builder: (context, provider, child) {
              if (provider.lessons.isEmpty) {
                fetchLessonsForLevelService(provider, widget.level.id);
              }
              return provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: defaultListPadding),
                        children: List.generate(
                            provider.lessons.length,
                            (index) => LessonListItem(
                                  itemNumber: index + 1,
                              lesson: provider.lessons[index]
                                )),
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
