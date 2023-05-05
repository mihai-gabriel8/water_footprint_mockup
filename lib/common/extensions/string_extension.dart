///TODO: OPTIMIZE FORMULA SEARCH
///
///*** */

extension StringExtension on String {
  // int? get score {}
  num calculate(String questionIdentifier, String valueIdentifier) {
    // Map of question identifier + value identifier to formulas
    final Map<String, num Function()> formulaMap = {
      'start_$valueIdentifier': () => 0,
      'shower_under_5_min': () => 20,
      'shower_5_10_min': () => 40,
      'shower_11_15_min': () => 65,
      'shower_over_15_min': () => 75,
      'bathtub_only_shower': () => 0,
      'bathtub_1_bath_per_week': () => 5,
      'bathtub_2-3_baths_per_week': () => 18,
      'bathroom_under_5_min': () => 20,
      'bathroom_5_10_min': () => 40,
      'bathroom_11_30_min': () => 100,
      'bathroom_over_30_min': () => 150,
      'toilet_of_course': () => 8,
      'toilet_no': () => 25,
      'toilet_sometimes': () => 17,
      'kitchen_sink_under_5_min': () => 20,
      'kitchen_sink_5_20_min': () => 65,
      'kitchen_sink_21_45_min': () => 165,
      'kitchen_sink_over_45_min': () => 225,
      'dishes_old_school_dishwasher': () => 0,
      'dishes_own_two_hands': () => 0,
      'dishes_trash_them': () => 0,
      'laundry_old_school_washing_machine': () => 0,
      'laundry_water_efficient_washing_machine': () => 0,
      'laundry_elbow_grease': () => 0,
      'laundry_laundromat': () => 0,
      'greywater_system_yes': () => -58,
      'greywater_system_no': () => 0,
      'lawn_garden_1_yes': () => 0,
      'lawn_garden_1_no': () => 0,
      'lawn_garden_2_1_99_SQ_FT': () => 0,
      'lawn_garden_2_100_500_SQ_FT': () => 0,
      'lawn_garden_2_500_1000_SQ_FT': () => 0,
      'lawn_garden_2_1000_5000_SQ_FT': () => 0,
      'rain_barrel_yes': () => -4,
      'rain_barrel_no': () => 0,
      'swimming_pool_yes': () => 0,
      'swimming_pool_no': () => 0,
      'car_washing_yes': () => 0,
      'car_washing_no': () => 0,
      'driving_$valueIdentifier': () =>
          double.parse(valueIdentifier) * 0.75 * 1.609,
      'electricity_$valueIdentifier': () => double.parse(valueIdentifier) - 100,
      'shopping_habits_basics': () => 0,
      'shopping_habits_like_to_shop': () => 0,
      'shopping_habits_shop_til_you_drop': () => 0,
      'paper_none': () => 0,
      'paper_some': () => -2,
      'paper_all': () => -4,
      'plastic_none': () => 0,
      'plastic_some': () => -8,
      'plastic_all': () => -16,
      'bottles_cans_none': () => 0,
      'bottles_cans_some': () => -15,
      'bottles_cans_all': () => -30,
      'fabrics_never': () => 0,
      'fabrics_sometimes': () => -3,
      'fabrics_allways': () => -6,
      'diet_vegan': () => 406,
      'diet_vegetarian': () => 563,
      'diet_meat_eater': () => 1283,
    };

    // Create the compound key using the question identifier and value identifier
    final key = '$questionIdentifier' '_' '$valueIdentifier';

    // Look up the formula based on the compound key
    final formula = formulaMap[key];

    // If a formula exists for the compound key, calculate and return the result
    if (formula != null) {
      return formula();
    }

    // If no formula exists for the compound key, return an error value
    throw Exception(
        'No formula found for question $questionIdentifier, value $valueIdentifier');
  }
}
