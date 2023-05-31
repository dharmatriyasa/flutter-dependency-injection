import 'package:flutter/material.dart';
import 'package:get_injectable/di/di.dart';
import 'package:get_injectable/models/user.dart';
import 'package:get_injectable/network/data/api_response.dart';
import 'package:get_injectable/network/user_service.dart';
import 'package:get_injectable/widgets/user_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  APIResponse<List<User>>? response;

  @override
  void initState() {
    _getUsers();
    super.initState();
  }

  void _getUsers() async {
    final result = await getIt.get<UserService>().getUsers();
    setState(() {
      response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (response != null) {
      if (!response!.isError) {
        final users = response!.data!;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return UserCard(
              name: users[index].name,
              username: users[index].username,
              email: users[index].email,
              company: users[index].company.name,
              website: users[index].website,
            );
          },
          itemCount: users.length,
        );
      } else {
        return Text(response!.errorMessage!);
      }
    } else {
      return const CircularProgressIndicator();
    }
  }
}
