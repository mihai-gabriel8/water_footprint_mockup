import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_footprint/features/home/view/home_view.dart';
import 'package:water_footprint/features/water_footprint/blocs/questionnaire_bloc.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'YOUR PROGRESS',
            style: TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: Text('CLOSE'),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                thickness: 2,
              ),
              BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.surveyStatus == SurveyStatus.initialFinished ||
                      state.surveyStatus == SurveyStatus.indoorFinished ||
                      state.surveyStatus == SurveyStatus.outdoorFinished ||
                      state.surveyStatus == SurveyStatus.virtualFinished) {
                    return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'START ',
                            style: TextStyle(fontSize: 26),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    );
                  }
                  return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'START ',
                        style: TextStyle(fontSize: 26),
                      ));
                },
              ),
              const Divider(
                thickness: 2,
              ),
              BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.surveyStatus == SurveyStatus.indoorFinished ||
                      state.surveyStatus == SurveyStatus.outdoorFinished ||
                      state.surveyStatus == SurveyStatus.virtualFinished) {
                    return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'INDOOR ',
                            style: TextStyle(fontSize: 26),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    );
                  }
                  return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'INDOOR ',
                        style: TextStyle(fontSize: 26),
                      ));
                },
              ),
              const Divider(
                thickness: 2,
              ),
              BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.surveyStatus == SurveyStatus.outdoorFinished ||
                      state.surveyStatus == SurveyStatus.virtualFinished) {
                    return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'OUTDOOR ',
                            style: TextStyle(fontSize: 26),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    );
                  }
                  return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'OUTDOOR ',
                        style: TextStyle(fontSize: 26),
                      ));
                },
              ),
              const Divider(
                thickness: 2,
              ),
              BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.surveyStatus == SurveyStatus.virtualFinished) {
                    return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'VIRTUAL ',
                            style: TextStyle(fontSize: 26),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    );
                  }
                  return GestureDetector(
                      onTap: () {
                        context.read<QuestionnaireBloc>().add(
                            CategoryChangedEvent(
                                category: QuestionsCategory.initial));
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'VIRTUAL ',
                        style: TextStyle(fontSize: 26),
                      ));
                },
              ),
              const Divider(
                thickness: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeView()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      'BACK TO DASHBOARD ',
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
