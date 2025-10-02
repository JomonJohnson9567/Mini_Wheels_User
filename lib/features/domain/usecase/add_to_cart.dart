// lib/features/domain/usecase/cart/add_to_cart.dart

import 'package:mini_wheelz_user/features/domain/entity/cart_item.dart';
import 'package:mini_wheelz_user/features/domain/repository/cart_repository.dart';
 

class AddToCartUseCase {
  final CartRepository repository;
  AddToCartUseCase(this.repository);

  Future<void> call(CartItem item) => repository.addToCart(item);
}
