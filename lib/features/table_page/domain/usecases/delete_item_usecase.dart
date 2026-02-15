import '../../../../core/usecase/usecase.dart';
import '../repositories/table_repository.dart';

class DeleteItemUsecase implements UseCase<void, int> {
  final TableRepository repository;

  DeleteItemUsecase(this.repository);

  @override
  Future<void> call({int? params}) async {
    await repository.deleteOrderItem(itemId: params!);
  }
}
