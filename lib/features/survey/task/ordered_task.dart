import 'package:json_annotation/json_annotation.dart';
import 'package:water_footprint/features/survey/task/task.dart';

import '../steps/step.dart';
import 'identifier/task_identifier.dart';

part 'ordered_task.g.dart';

/// Defines a [Task] which handles its steps in the order of the [steps] list.
@JsonSerializable(createFactory: false)
class OrderedTask extends Task {
  OrderedTask({
    required TaskIdentifier id,
    required List<Step> steps,
    Step? initialStep,
  }) : super(
          id: id,
          steps: steps,
          initalStep: initialStep,
        );

  factory OrderedTask.fromJson(Map<String, dynamic> json) => OrderedTask(
        id: TaskIdentifier.fromJson(json),
        steps: json['steps'] != null
            ? (json['steps'] as List<Map<String, dynamic>>)
                .map((step) => Step.fromJson(step))
                .toList()
            : [],
      );

  @override
  Map<String, dynamic> toJson() => _$OrderedTaskToJson(this);
}
