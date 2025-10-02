import 'package:mini_wheelz_user/features/domain/entity/product_entity.dart';
import 'package:mini_wheelz_user/features/domain/repository/product_repository.dart';


class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() {
    return repository.fetchProducts();
  }
}
