import 'package:mini_wheelz_user/features/domain/entity/user_entity.dart';
import 'package:mini_wheelz_user/features/domain/repository/auth_repository.dart';


class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<UserEntity> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
