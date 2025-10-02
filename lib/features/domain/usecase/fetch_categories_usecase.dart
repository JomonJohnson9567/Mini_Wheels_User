import 'package:mini_wheelz_user/features/domain/repository/product_repository.dart';

class FetchCategoriesUseCase {
  final ProductRepository repository;
  FetchCategoriesUseCase(this.repository);
  Future<List<String>> call() => repository.fetchCategories();
}
