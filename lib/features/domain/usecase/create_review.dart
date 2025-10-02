import 'package:mini_wheelz_user/features/domain/entity/review_entity.dart';
import 'package:mini_wheelz_user/features/domain/repository/review_repository.dart';


class CreateReviewUseCase {
  final ReviewRepository repository;
  CreateReviewUseCase(this.repository);

  Future<String> call(ReviewEntity review) async {
    return await repository.createReview(review);
  }
}
