// lib/features/domain/usecase/cart/get_cart_items.dart
import 'package:mini_wheelz_user/features/domain/entity/cart_item.dart';
import 'package:mini_wheelz_user/features/domain/repository/cart_repository.dart';


class GetCartItemsUseCase {
  final CartRepository repository;
  GetCartItemsUseCase(this.repository);

  Stream<List<CartItem>> call() => repository.getCartItems();
}
