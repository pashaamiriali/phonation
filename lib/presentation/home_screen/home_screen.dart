import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/home_screen/widgets/game_widget.dart';
import 'package:phonation/presentation/home_screen/widgets/lessons_widget.dart';
import 'package:phonation/presentation/widgets/background_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
          child: BackgroundWidget(
        foreground: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultListPadding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image(image: AssetImage('assets/img/home_showcase.png'), height: 130,fit: BoxFit.contain,),
                  SizedBox(
                    height: 60,
                  ),
                  LessonsWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  GameWidget(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      )
          // MaterialButton(
          //   onPressed: () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (ctx) => LessonsScreen()));
          //   },
          //   child: Text('Lessons'),
          // ),
          ),
    );
  }
}
