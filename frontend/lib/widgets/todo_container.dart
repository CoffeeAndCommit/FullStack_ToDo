// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

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
    final titlecontroller = TextEditingController();
    final desccontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (() {
          titlecontroller.text = title;
          desccontroller.text = description;

          customModal(context, titlecontroller, desccontroller);
        }),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            // color: Colors.purple,
            color: completed ? green : red,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
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
      ),
    );
  }

  Future<dynamic> customModal(
      BuildContext context,
      TextEditingController titlecontroller,
      TextEditingController desccontroller,) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  const Text(
                    "Update Todos",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: titlecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Title',

                      labelStyle: TextStyle(
                        color: Colors.purple, // 👈 change hint color here
                      ),
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: Colors.purple, // 👈 change hint color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.purple, // Normal state
                          width: 2,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.deepPurple, // When typing
                          width: 2,
                        ),
                      ),

                      border: OutlineInputBorder(), // keep default shape
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: desccontroller,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description',
                      labelStyle: TextStyle(
                        color: Colors.purple, // 👈 change hint color here
                      ),
                      hintStyle: TextStyle(
                        color: Colors.purple, // 👈 change hint color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.purple, // Normal state
                          width: 2,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.deepPurple, // When typing
                          width: 2,
                        ),
                      ),

                      border: OutlineInputBorder(), // keep default shape
                    ),
                  ),
                  // const Spacer(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onPressed();
                      Navigator.pop(context);
                      titlecontroller.clear();
                      desccontroller.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
              ),
            ),
          );
        }));
  }
}
