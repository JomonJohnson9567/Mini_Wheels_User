import 'package:mini_wheelz_user/features/domain/repository/cart_repository.dart';


class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<void> call() async {
    return await repository.clearCart();
  }
}
