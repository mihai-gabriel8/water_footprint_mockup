import 'package:flutter/material.dart';
import 'package:water_footprint/features/survey/answer_format/scale_answer_format.dart';
import 'package:water_footprint/features/survey/navigator/rules/conditional_navigation_rule.dart';
import 'package:water_footprint/features/survey/navigator/rules/direct_navigation_rule.dart';
import 'package:water_footprint/features/survey/navigator/rules/navigation_rule.dart';
import 'package:water_footprint/features/survey/steps/step.dart' as step;

import '../../features/survey/answer_format/multiple_choice_answer_format.dart';
import '../../features/survey/answer_format/single_choice_answer_format.dart';
import '../../features/survey/answer_format/text_choice.dart';
import '../../features/survey/steps/identifier/step_identifier.dart';
import '../../features/survey/steps/predefined_steps/question_step.dart';

class QuestionsConfig {
  static List<step.Step> indoorSteps = [
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'shower'),
      isOptional: false,
      iconData1: Icons.shower_outlined,
      title: "shower",
      text: "How long is the average shower in your household?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "UNDER 5 MIN",
            value: "under_5_min",
          ),
          TextChoice(
            text: "5-10 MIN",
            value: "5_10_min",
          ),
          TextChoice(
            text: "11-15 MIN",
            value: "11_15_min",
          ),
          TextChoice(
            text: "OVER 15 MIN",
            value: "over_15_min",
          ),
        ],
      ),
    ),
    QuestionStep(
      iconData1: Icons.bathtub_outlined,
      stepIdentifier: StepIdentifier(id: 'bathtub'),
      title: 'bathtub',
      text: 'Do you take baths? If so, how often?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "NO, I ONLY SHOWER",
            value: "only_shower",
          ),
          TextChoice(
            text: "1 BATH PER WEEK",
            value: "1_bath_per_week",
          ),
          TextChoice(
            text: "2-3 BATHS PER WEEK",
            value: "2-3_baths_per_week",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'bathroom'),
      isOptional: false,
      iconData1: Icons.bathroom_outlined,
      title: "bathroom sink",
      text: "How long do you leave your bathroom faucets running each day?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "UNDER 5 MIN",
            value: "under_5_min",
          ),
          TextChoice(
            text: "5-10 MIN",
            value: "5_10_min",
          ),
          TextChoice(
            text: "11-30 MIN",
            value: "11_30_min",
          ),
          TextChoice(
            text: "OVER 30 MIN",
            value: "over_30_min",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'toilet'),
      iconData1: Icons.bathroom_outlined,
      title: 'toilet',
      text: "Do you 'let it mellow?'",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'OF COURSE', value: 'of_course'),
          TextChoice(text: 'NO!', value: 'no'),
          TextChoice(text: 'SOMETIMES', value: 'sometimes'),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'kitchen_sink'),
      iconData1: Icons.kitchen_outlined,
      title: "kitchen sink",
      text: "How long do you leave your kitchen faucet running each day?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "UNDER 5 MIN",
            value: "under_5_min",
          ),
          TextChoice(
            text: "5-20 MIN",
            value: "5_20_min",
          ),
          TextChoice(
            text: "21-45 MIN",
            value: "21_45_min",
          ),
          TextChoice(
            text: "OVER 45 MIN",
            value: "over_45_min",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'dishes'),
      iconData1: Icons.countertops,
      title: 'dishes',
      text: "How do you wash your dishes?",
      isOptional: false,
      answerFormat: const MultipleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "OLD SCHOOL DISHWASHER",
            value: "old_school_dishwasher",
          ),
          TextChoice(
            text: "WATER/ENERGY EFFICIENT DISHWASHER",
            value: "water/energy_efficient_dishwasher",
          ),
          TextChoice(
            text: "WITH MY OWN HANDS",
            value: "own_two_hands",
          ),
          TextChoice(
            text: "TRASH THEM OR EAT OUT",
            value: "trash_them",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'laundry'),
      iconData1: Icons.local_laundry_service,
      title: 'laundry',
      text: "How do you do laundry?",
      isOptional: false,
      answerFormat: const MultipleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "OLD SCHOOL WASHING MACHINE",
            value: "old_school_washing_machine",
          ),
          TextChoice(
            text: "WATER/ENERGY EFFICIENT WASHING MACHINE",
            value: "water_efficient_washing_machine",
          ),
          TextChoice(
            text: "ELBOW GREASE",
            value: "elbow_grease",
          ),
          TextChoice(
            text: "LAUNDROMAT OR PAY SOMEONE ELSE",
            value: "laundromat",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'greywater_system'),
      iconData1: Icons.hardware_outlined,
      title: 'greywater system',
      text: "Do you have a greywater system installed in your home?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'YES', value: 'yes'),
          TextChoice(text: 'NO', value: 'no'),
        ],
      ),
    ),
  ];

  static List<step.Step> outdoorSteps = [
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'lawn_garden_1'),
      iconData1: Icons.home,
      title: "lawn & garden",
      text: "Do you water a lawn or garden?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "YES",
            value: 'yes',
          ),
          TextChoice(
            text: "NO",
            value: 'no',
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'lawn_garden_2'),
      iconData1: Icons.home,
      title: "lawn & garden",
      text: 'What is the area of the lawn or garden?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "1-99 SQ FT",
            value: "1_99_SQ_FT",
          ),
          TextChoice(
            text: "100-500 SQ FT",
            value: "100_500_SQ_FT",
          ),
          TextChoice(
            text: "500-1,000 SQ FT",
            value: "500_1000_SQ_FT",
          ),
          TextChoice(
            text: "1,000-5,000 SQ FT",
            value: "1000_5000_SQ_FT",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'rain_barrel'),
      iconData1: Icons.hardware_outlined,
      title: 'rain barrel',
      text: 'Do you have a rain barrel?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "YES",
            value: "yes",
          ),
          TextChoice(
            text: "NO",
            value: "no",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'swimming_pool'),
      iconData1: Icons.pool_outlined,
      isOptional: false,
      title: "swimming pool",
      text: "Do you have a swimming pool?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "YES",
            value: "yes",
          ),
          TextChoice(
            text: "NO",
            value: "no",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'car_washing'),
      iconData1: Icons.local_car_wash_outlined,
      title: 'carwashing',
      text: "Do you have a car?",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'YES', value: 'yes'),
          TextChoice(text: 'NO', value: 'no'),
        ],
      ),
    ),
  ];

  static List<step.Step> virtualSteps = [
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'driving'),
      iconData1: Icons.directions_car_outlined,
      title: "driving",
      text: "How many kilometers do you drive per week?",
      answerFormat: const ScaleAnswerFormat(
        isPercentage: false,
        maximumValue: 3000,
        minimumValue: 0,
        defaultValue: 0,
        step: 10,
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'electricity'),
      iconData1: Icons.electric_bolt_outlined,
      title: "electricity",
      isPercentage: true,
      text: "Where does your electricity come from?",
      answerFormat: const ScaleAnswerFormat(
        isPercentage: true,
        maximumValue: 100,
        minimumValue: 0,
        defaultValue: 0,
        step: 10,
        minimumValueDescription: 'AT HOME',
        maximumValueDescription: 'ELECTRIC UTILITY',
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'shopping_habits'),
      iconData1: Icons.shopping_cart_checkout_outlined,
      title: "shopping habits",
      text: "How much do you shop?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(
            text: "SHOP FOR BASICS",
            value: "basics",
          ),
          TextChoice(
            text: "LIKE TO SHOP",
            value: "like_to_shop",
          ),
          TextChoice(
            text: "SHOP TIL YOU DROP",
            value: "shop_til_you_drop",
          ),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'paper'),
      iconData1: Icons.recycling_outlined,
      title: 'paper',
      text: "Do you recycle PAPER?",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'NONE', value: 'none'),
          TextChoice(text: 'SOME', value: 'some'),
          TextChoice(text: 'ALL', value: 'all'),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'plastic'),
      iconData1: Icons.recycling_outlined,
      title: "plastic",
      text: "Do you recycle PLASTIC?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'NONE', value: 'none'),
          TextChoice(text: 'SOME', value: 'some'),
          TextChoice(text: 'ALL', value: 'all'),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'bottles_cans'),
      iconData1: Icons.recycling_outlined,
      title: 'bottles & cans',
      text: "Do you recycle BOTTLES & CANS?",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'NONE', value: 'none'),
          TextChoice(text: 'SOME', value: 'some'),
          TextChoice(text: 'ALL', value: 'all'),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'fabrics'),
      iconData1: Icons.recycling_outlined,
      title: 'fabrics',
      text:
          "Do you donate or re-use old clothing, sheets, blankets and towels?",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'NEVER', value: 'never'),
          TextChoice(text: 'SOMETIMES', value: 'sometimes'),
          TextChoice(text: 'ALLWAYS', value: 'allways'),
        ],
      ),
    ),
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'diet'),
      iconData1: Icons.restaurant_menu_outlined,
      title: 'diet',
      text: "What's your diet?",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'VEGAN', value: 'vegan'),
          TextChoice(text: 'VEGETARIAN', value: 'vegetarian'),
          TextChoice(text: 'MEAT EATER', value: 'meat_eater'),
        ],
      ),
    ),
  ];

  static List<step.Step> initialStep = [
    QuestionStep(
      stepIdentifier: StepIdentifier(id: 'start'),
      iconData1: Icons.start_outlined,
      title: 'Start',
      text: "What's your water footprint?",
      isOptional: true,
      buttonText: 'CONTINUE',
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [],
      ),
    ),
  ];
}
