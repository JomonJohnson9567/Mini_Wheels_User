import 'package:mini_wheelz_user/features/domain/entity/product_rating.dart';
import 'package:mini_wheelz_user/features/domain/repository/review_repository.dart';



class GetProductRatingUseCase {
  final ReviewRepository repository;
  GetProductRatingUseCase(this.repository);

  Future<ProductRating> call(String productId) async {
    return await repository.getProductRating(productId);
  }
}
