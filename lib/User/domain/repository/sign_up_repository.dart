import 'package:diagro/User/domain/inputs/sign_up_repository.dart';
import 'package:diagro/User/domain/responses/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
