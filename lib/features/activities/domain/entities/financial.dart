import 'package:equatable/equatable.dart';

import 'payment.dart';

class Financial extends Equatable {
  final num totalEarnings;
  final List<Payment> payments;

  const Financial({required this.totalEarnings, required this.payments});
  @override
  List<Object?> get props => [totalEarnings, payments];
}
