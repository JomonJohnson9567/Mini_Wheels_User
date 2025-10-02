import 'package:mini_wheelz_user/features/domain/entity/order_entity.dart';
import 'package:mini_wheelz_user/features/domain/repository/order_repository.dart';


class GetOrderByIdUseCase {
  final OrderRepository repository;

  GetOrderByIdUseCase(this.repository);

  Future<OrderEntity?> call(String orderId) async {
    return await repository.getOrderById(orderId);
  }
}
