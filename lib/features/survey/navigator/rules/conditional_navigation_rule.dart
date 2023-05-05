import '../../steps/identifier/step_identifier.dart';
import 'navigation_rule.dart';

class ConditionalNavigationRule implements NavigationRule {
  final StepIdentifier? Function(String?) resultToStepIdentifierMapper;

  ConditionalNavigationRule({required this.resultToStepIdentifierMapper});

  factory ConditionalNavigationRule.fromJson(Map<String, dynamic> json) {
    final inputValues = json['values'] as Map<String, dynamic>;
    return ConditionalNavigationRule(
      resultToStepIdentifierMapper: (input) {
        for (final MapEntry entry in inputValues.entries) {
          if (entry.key == input) {
            return StepIdentifier(id: entry.value);
          }
        }
        return null;
      },
    );
  }

  Map<String, dynamic> toJson() => {'values': {}};
}
