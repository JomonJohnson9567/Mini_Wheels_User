// get_profile_usecase.dart
import 'package:mini_wheelz_user/features/domain/entity/profile_entity.dart';
import 'package:mini_wheelz_user/features/domain/repository/profile_repository.dart';


class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Profile?> call(String uid) async {
    return await repository.getProfile(uid);
  }
}
