import 'package:get_injectable/models/user.dart';
import 'package:get_injectable/network/data/api_response.dart';

abstract class UserService {
  Future<APIResponse<User>> getUserById(int id);

  Future<APIResponse<List<User>>> getUsers();
}
