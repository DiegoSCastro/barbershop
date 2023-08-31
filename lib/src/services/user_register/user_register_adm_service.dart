import '../../core/fp/either.dart';
import '../../core/fp/nil.dart';

abstract interface class UserRegisterAdmService {
  Future<Either<Exception, Nil>> execute(
      ({
        String name,
        String email,
        String password,
      }) userData);
}
