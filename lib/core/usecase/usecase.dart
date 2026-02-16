// ignore: avoid_types_as_parameter_names
abstract class UseCase<Type, Params> {
  Future<Type> call({required Params params});
}

class NoParams {}

class GetOrderItemsParams {
  final int orderId;
  final String locale;

  GetOrderItemsParams({required this.orderId, required this.locale});
}
