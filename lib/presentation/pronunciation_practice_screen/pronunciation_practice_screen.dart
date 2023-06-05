import 'package:flutter/material.dart';
import 'package:phonation/core/entities/lesson.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/pronunciation_practice_screen/highlightable_text.dart';
import 'package:phonation/presentation/provider/pronunciation_practice_provider.dart';
import 'package:phonation/presentation/provider/speech_to_text_provider.dart';
import 'package:phonation/presentation/provider/text_to_speech_provider.dart';
import 'package:phonation/presentation/widgets/background_widget.dart';
import 'package:phonation/presentation/widgets/body_text.dart';
import 'package:phonation/presentation/widgets/custom_touchable.dart';
import 'package:phonation/presentation/widgets/general_app_bar.dart';
import 'package:phonation/presentation/widgets/large_title.dart';
import 'package:phonation/presentation/widgets/show_loading_before_widget.dart';
import 'package:provider/provider.dart';

class PronunciationPracticeScreen extends StatefulWidget {
  final Lesson lesson;

  const PronunciationPracticeScreen({Key? key, required this.lesson})
      : super(key: key);

  @override
  State<PronunciationPracticeScreen> createState() =>
      _PronunciationPracticeScreenState();
}

class _PronunciationPracticeScreenState
    extends State<PronunciationPracticeScreen> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        foreground: Consumer<PronunciationPracticeProvider>(
            builder: (context, provider, child) {
              return provider.initialized
                  ? Consumer<TextToSpeechProvider>(
                  builder: (context, ttsProvider, child) {
                    ttsProvider.text = provider
                        .getCurrentPractice()
                        .transcript;
                    return Column(
                      children: [
                        GeneralAppBar(appBarTitle: widget.lesson.title),
                        ShowLoadingBeforeWidget(
                          showLoading: !provider.initialized,
                          child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultListPadding),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const LargeTitle(text: "Transcript"),
                                    const SizedBox(height: 18),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: surfaceColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          HighlightableText(
                                              text: provider
                                                  .getCurrentPractice()
                                                  .transcript,
                                              highlight: ttsProvider
                                                  .currentWord),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    const BodyText(
                                        text: "Listen and repeat..."),
                                    const SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Consumer<SpeechToTextProvider>(
                                            builder: (context, sttProvider,
                                                child) {
                                              return CustomTouchable(
                                                onTap: () async {
                                                  if (sttProvider.available) {
                                                    sttProvider.listen();
                                                    showListeningBottomSheet(context);
                                                  } else {
                                                    await sttProvider.init();
                                                    sttProvider.listen();
                                                    showListeningBottomSheet(context);
                                                  }
                                                },
                                                radius: 7,
                                                padding: 20,
                                                surface: surfaceColor,
                                                child: sttProvider.isLoading
                                                    ? const CircularProgressIndicator()
                                                    : const Icon(
                                                  Icons.keyboard_voice,
                                                  color: mainColor,
                                                  size: 30,
                                                ),
                                              );
                                            }),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        CustomTouchable(
                                          onTap: () async {
                                            if (!playing) {
                                              if (ttsProvider.initialized) {
                                                ttsProvider.speak();
                                                setState(() {
                                                  playing = true;
                                                });
                                              } else {
                                                await ttsProvider.initialize();
                                                ttsProvider.speak();
                                                setState(() {
                                                  playing = true;
                                                });
                                              }
                                              // final player = AudioPlayer();
                                              // await player.setAsset(audioBasePath +
                                              //     provider.practice.audioFileName);
                                              // player.play();
                                              // setState(() {
                                              //   playing = true;
                                              // });
                                            } else {
                                              await ttsProvider.stop();
                                              setState(() {
                                                playing = false;
                                              });
                                            }
                                          },
                                          radius: 7,
                                          padding: 20,
                                          surface: playing
                                              ? mainColor
                                              : surfaceColor,
                                          child: ttsProvider.isLoading
                                              ? const CircularProgressIndicator()
                                              : Icon(
                                            playing
                                                ? Icons.surround_sound
                                                : Icons.headphones,
                                            color: playing
                                                ? Colors.white
                                                : mainColor,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
                  })
                  : const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
  showListeningBottomSheet(BuildContext context){
    showBottomSheet(context: context, builder: (context){
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(defaultListPadding),
        child: Consumer<SpeechToTextProvider>(
          builder: (context, provider, child) {
            String titleText="";
            if(provider.listening){
              titleText="Listening...";
            }else{
              List<String> recognizedWords=provider.finalResult.split(' ');
              var ppProvider=Provider.of<PronunciationPracticeProvider>(context,listen: false);
              String expected=ppProvider.getCurrentPractice().transcript;
            int allExpectedWords=expected.split(' ').length;
            int correctPronunciations=0;
            for(var word in recognizedWords){
              if(expected.toLowerCase().contains(word)){
                correctPronunciations+=1;
              }
            }
            double resultInPercent=(correctPronunciations/allExpectedWords)*100;
            titleText="You were ${resultInPercent.round()}% correct!";
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 LargeTitle(
                  text: titleText,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTouchable(
                  onTap: () {
                   //TODO: go for the next pronunciation practice
                    var ppProvider=Provider.of<PronunciationPracticeProvider>(context,listen: false);
                    if(ppProvider.markDone()) {
                       Navigator.of(context).pop();
                      }
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
            );
          }
        ),
      );
    });
  }
}
