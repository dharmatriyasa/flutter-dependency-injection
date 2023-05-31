import 'dart:convert';

import 'package:get_injectable/common/constants.dart';
import 'package:get_injectable/models/user.dart';
import 'package:get_injectable/network/data/api_response.dart';
import 'package:get_injectable/network/user_service.dart';
import 'package:http/http.dart' as http;

class UserServiceImpl implements UserService {
  @override
  Future<APIResponse<User>> getUserById(int id) async {
   try {
     final response = await http.get(Uri.parse('${Network.baseUrl}/users/$id'));

     if (response.statusCode == 200) {
       final jsonData = jsonDecode(response.body);
       final user = User.fromJson(jsonData);
       return APIResponse<User>(
         data: user,
       );
     } else {
       return APIResponse<User>(
         isError: true,
         errorMessage: "Something went wrong.",
       );
     }
   } catch (e) {
     return APIResponse<User>(
       isError: true,
       errorMessage: "Connection issue, try again later.",
     );
   }
  }

  @override
  Future<APIResponse<List<User>>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('${Network.baseUrl}/users'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final users = jsonData.map<User>((user) => User.fromJson(user)).toList();
        return APIResponse<List<User>>(
          data: users,
        );
      } else {
        return APIResponse<List<User>>(
          isError: true,
          errorMessage: "Something went wrong.",
        );
      }
    } catch (e) {
      print("result: $e");
      return APIResponse<List<User>>(
        isError: true,
        errorMessage: "Connection issue, try again later.",
      );
    }
  }
}
