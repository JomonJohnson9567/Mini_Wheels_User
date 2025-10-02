import 'package:mini_wheelz_user/features/domain/entity/product_rating.dart';
import 'package:mini_wheelz_user/features/domain/entity/review_entity.dart';
 

abstract class ReviewRepository {
  Future<String> createReview(ReviewEntity review);
  Future<List<ReviewEntity>> getProductReviews(String productId);
  Future<ProductRating> getProductRating(String productId);
  Future<bool> hasUserReviewedProduct(String userId, String productId);
  Future<void> updateReview(ReviewEntity review);
  Future<void> deleteReview(String reviewId);
}
