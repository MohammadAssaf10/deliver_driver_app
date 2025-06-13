import 'package:injectable/injectable.dart';

import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../core/models/base_model.dart';
import '../../../../core/network/endpoints.dart';
import '../models/financial_model.dart';
import 'activities_remote_data_source.dart';

@LazySingleton(as: ActivitiesRemoteDataSource)
class ActivitiesRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ActivitiesRemoteDataSource {
  @override
  Future<FinancialModel> getDriverFinancialHistory() async {
    final BaseModel baseModel = await performGetRequest(
      endpoint: Endpoints.finance,
    );
    return FinancialModel.fromJson(baseModel.data);
  }
}
