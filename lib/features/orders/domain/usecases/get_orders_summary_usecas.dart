import 'package:peng_cafe/features/orders/domain/repositories/orders_repository.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/models/orders_section_model.dart';

class GetOrdersSummaryUsecase
    implements UseCase<List<OrdersSection>, NoParams> {
  final OrdersRepository repo;

  GetOrdersSummaryUsecase(this.repo);

  @override
  Future<List<OrdersSection>> call({required NoParams params}) {
    return repo.getOrdersSummary();
  }
}
