import 'package:flutter/material.dart';

class CustomElevatedSheet extends StatelessWidget {
  final TextEditingController titlecontroller;
  final TextEditingController desccontroller;
  final Function() onPressed;
  const CustomElevatedSheet({
    Key? key,
    required this.titlecontroller,
    required this.desccontroller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: ((context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      const Text(
                        "Add Todos",
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
     
     
      },
      backgroundColor: const Color.fromARGB(255, 115, 28, 105),
      tooltip: 'Add Todos',
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
