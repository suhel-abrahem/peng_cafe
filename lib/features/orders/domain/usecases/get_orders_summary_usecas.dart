import 'package:peng_cafe/core/enums/duration_enum.dart';
import 'package:peng_cafe/features/orders/domain/repositories/orders_repository.dart';

import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/orders_section_model.dart';

class GetOrdersSummaryUsecase
    implements UseCase<DataState<List<OrdersSection>>, DurationEnum> {
  final OrdersRepository repo;

  GetOrdersSummaryUsecase(this.repo);

  @override
  Future<DataState<List<OrdersSection>>> call({required DurationEnum params}) {
    return repo.getOrdersSummary(duration: params);
  }
}
