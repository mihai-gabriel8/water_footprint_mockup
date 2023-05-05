import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/survey_controller.dart';
import '../../result/question_result.dart';
import '../../steps/step.dart' as surveystep;

class StepView extends StatelessWidget {
  final surveystep.Step step;
  final Widget title;
  final Widget child;
  final QuestionResult Function() resultFunction;
  final bool isValid;
  final SurveyController? controller;

  const StepView(
      {super.key,
      required this.step,
      required this.child,
      required this.title,
      required this.resultFunction,
      this.isValid = true,
      this.controller});

  @override
  Widget build(BuildContext context) {
    final _surveyController = controller ?? context.read<SurveyController>();
    return _content(_surveyController, context);
  }

  Widget _content(SurveyController surveyController, BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32.0,
                ),
                child: title,
              ),
              child,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: isValid || step.isOptional
                      ? () => surveyController.nextStep(context, resultFunction)
                      : null,
                  child: Text(
                    step.buttonText?.toUpperCase() ??
                        context
                            .read<Map<String, String>?>()?['next']
                            ?.toUpperCase() ??
                        'NEXT',
                    style: TextStyle(
                      color: isValid
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
