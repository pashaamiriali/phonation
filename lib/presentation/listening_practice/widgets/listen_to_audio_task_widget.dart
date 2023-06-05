import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:phonation/constants/app_constants.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/widgets/custom_touchable.dart';
import 'package:phonation/presentation/widgets/large_title.dart';
import 'package:phonation/presentation/widgets/transcript_text.dart';

class ListenToAudioTaskWidget extends StatefulWidget {
  const ListenToAudioTaskWidget({super.key, required this.done});

  final Function done;

  @override
  _ListenToAudioTaskWidgetState createState() =>
      _ListenToAudioTaskWidgetState();
}

class _ListenToAudioTaskWidgetState extends State<ListenToAudioTaskWidget> {
  bool playing = false;

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
              height: 20,
            ),
            Image.asset(
              listenShowcaseImage,
              height: 200,
            ),
            const SizedBox(
              height: 70,
            ),
            CustomTouchable(
              onTap: () async {
                final player = AudioPlayer();
                if (!playing) {
                  await player.setAsset(audioBasePath + 'a1_l1.mp3');
                  setState(() {
                    playing = true;
                  });
                  await player.play();
                  showNextBottomSheet(context);
                } else {
                  await player.pause();
                  setState(() {
                    playing = false;
                  });
                }
                ;
              },
              padding: 20,
              radius: 7,
              child: Icon(
                playing ? Icons.play_circle_outline : Icons.headphones,
                size: 24,
                color: playing ? Colors.white : mainColor,
              ),
              surface: playing ? mainColor : surfaceColor,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomProgressIndicator(width: width / 3, progress: 0.5),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "00:30 / 01:45",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTouchable(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (context) =>
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2,
                          padding: EdgeInsets.all(defaultListPadding),
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.close_rounded,
                                      size: 24, color: mainColor),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: TranscriptText(
                                    transcript: '''
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        this isi a text that is goind to be showed for the audio
                                        
                                        
                                        ''',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
              },
              padding: 20,
              radius: 7,
              surface: activeColor,
              child: const Icon(
                Icons.text_snippet_outlined,
                size: 24,
                color: mainColor,
              ),
            ),
          ],
        ));
  }

  PersistentBottomSheetController<dynamic> showNextBottomSheet(
      BuildContext context) {
    return showBottomSheet(
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
                  text: "Now let's practice",
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
  }
}

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.width,
    required this.progress,
  });

  final double width;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: mainColor,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: width * progress - 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
