import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final num createdDate;
  final num value;
  final num tripId;

  const Payment({
    required this.createdDate,
    required this.value,
    required this.tripId,
  });
  @override
  List<Object?> get props => [createdDate, value, tripId];
}
