import 'package:flutter/material.dart';
import 'package:frontend/widgets/appBar.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'dart:convert';

import '../constants/api.dart';
import '../model/todo.dart';
import '../widgets/todo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int done = 0;
  int incomplete = 0;

  List<ToDo> myTodos = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
  }

  fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
        api,
      ));
      var data = jsonDecode(response.body);
      print(data);
      print(data.runtimeType);
      data.forEach((element) {
        ToDo t = ToDo(
            id: element['id'],
            title: element['title'],
            description: element['description'],
            completed: element['completed'],
            created_at: element['created_at'],
            updated_at: element['updated_at']);

        if (t.completed == true) {
          done++;
        } else {
          incomplete++;
        }

        myTodos.add(t);
        setState(() {
          isLoading = false;
        });
      });

      print('length:${myTodos.length}}');
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void delete_todo(String id) async {
    try {
      http.Response response = await http.delete(
        Uri.parse('$api$id/'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        // body: jsonEncode(<String, String>{'id': id}),
      );
      setState(() {
        myTodos = [];
      });
      fetchData();
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001133),
      appBar: customAppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: PieChart(
                    dataMap: {
                      "Done": done.toDouble(),
                      "Incomplete": incomplete.toDouble(),
                    },
                    legendOptions: const LegendOptions(
                      legendTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    colorList: const [
                      Colors.green,
                      Colors.red,
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: myTodos.map((e) {
                      return TodoContainer(
                          onPressed: () {
                            delete_todo(e.id.toString());
                          },
                          id: e.id,
                          title: e.title,
                          description: e.description,
                          completed: e.completed,
                          created_at: e.created_at,
                          updated_at: e.updated_at);
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
