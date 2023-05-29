import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String company;
  final String website;

  const UserCard({
    Key? key,
    required this.name,
    required this.username,
    required this.email,
    required this.company,
    required this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            '$username & $email',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4.0,),
          Text(
            company,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          Text(
            website,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
