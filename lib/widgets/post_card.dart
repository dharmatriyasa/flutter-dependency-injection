import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final String name;
  final String email;

  const PostCard({
    Key? key,
    required this.title,
    required this.body,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8.0,),
          Text(
            body,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
          const Divider(
            height: 8,
            thickness: 0.5,
            indent: 4,
            endIndent: 4,
            color: Colors.black45,
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            email,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
