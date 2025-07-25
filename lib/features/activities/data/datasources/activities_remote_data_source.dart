import '../../../../core/data_source/remote/base_remote_data_source.dart';
import '../models/financial_model.dart';
import '../models/history_model.dart';

abstract class ActivitiesRemoteDataSource extends BaseRemoteDataSource {
  Future<FinancialModel> getDriverFinancialHistory();
  Future<List<HistoryModel>> getDriverTripsHistory();
}
