import 'package:mini_wheelz_user/features/domain/entity/order_entity.dart';
import 'package:mini_wheelz_user/features/domain/repository/order_repository.dart';


class CreateOrderUseCase {
  final OrderRepository repository;

  CreateOrderUseCase(this.repository);

  Future<String> call(OrderEntity order) async {
    return await repository.createOrder(order);
  }
}
