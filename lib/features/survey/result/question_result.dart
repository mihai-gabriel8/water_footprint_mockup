import '../steps/identifier/identifier.dart';
import 'result.dart';

abstract class QuestionResult<T> extends Result {
  final T? result;
  final String? valueIdentifier;
  const QuestionResult({
    required Identifier? id,
    required DateTime startDate,
    required DateTime endDate,
    required this.valueIdentifier,
    required this.result,
  }) : super(id: id, startDate: startDate, endDate: endDate);
}
