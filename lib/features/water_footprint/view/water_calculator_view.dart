import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_footprint/features/score/view/score_tracker.dart';
import 'package:water_footprint/features/water_footprint/blocs/questionnaire_bloc.dart';
import 'package:water_footprint/features/selection/view/selector_view.dart';
import 'package:water_footprint/features/water_footprint/view/questionnaire_view.dart';

import '../../../app/app_theme.dart';
import '../../../common/widgets/measure_scale.dart';
import '../../../common/widgets/wave.dart';
import 'widgets/survey_title.dart';

//TODO: INDEXED STACK INSTEAD OF PAGEVIEW

// VOIDCALLBACK FUNCTION ONPRESSED

// **** //

class WaterCalculatorView extends StatefulWidget {
  const WaterCalculatorView({super.key});

  @override
  State<WaterCalculatorView> createState() => _WaterCalculatorViewState();
}

class _WaterCalculatorViewState extends State<WaterCalculatorView> {
  bool isTurbulent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        titleTextStyle: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        elevation: 0,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectionView()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: SurveyTitle(),
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: 65,
            left: 50,
            child: ScoreTracker(),
          ),
          const Positioned(
            top: 110,
            left: 50,
            child: Text('Liters/Day'),
          ),
          Wave(
              height: 800,
              value: 0,
              moveOffset: 3.14,
              isTurbulent: isTurbulent,
              color: ColorConstants.alaskanWind),
          Wave(
            height: 900,
            value: 0,
            moveOffset: 3.14,
            isTurbulent: isTurbulent,
            color: ColorConstants.andromedaBlue,
          ),
          const OverflowBox(
            child: MeasureScale(
              height: 800,
              divisions: 80,
            ),
          ),
          const QuestionnaireView(),
        ],
      ),
    );
  }
}
