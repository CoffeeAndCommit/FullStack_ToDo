// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final bool completed;
  final String created_at;
  final String? updated_at;
  final Function() onPressed;

  const TodoContainer({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.created_at,
    this.updated_at,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                    iconSize: 20,
                    tooltip: 'Delete',
                    // label: const Text('Delete'),
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
