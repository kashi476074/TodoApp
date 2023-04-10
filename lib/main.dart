import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  myapp createState() => myapp();
}

class myapp extends State<MyApp> {
  final TextEditingController eCtrl = new TextEditingController();
  List<String> todo = [];
  add() {
    if (todo.isEmpty) {
      return Container(
        child: Text("Vele log "),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: todo.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: Text("${index + 1}")),
                  Container(child: Text("${todo[index]}")),
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          todo.removeAt(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(style: BorderStyle.solid)),
                        child: Icon(Icons.delete_forever),
                      ),
                    ),
                  )
                ]);
          });
    }
  }

  remove() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toto"),
        backgroundColor: Color.fromARGB(240, 18, 59, 70),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logos/background.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Tolo",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(6)),
                  controller: eCtrl,
                  onSubmitted: (value) {
                    eCtrl.clear();
                    try {
                      todo.add(value);
                    } catch (exception) {
                      debugPrint("What are you going");
                    }

                    setState(() {});

                    debugPrint(todo[0] + todo[1]);
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: add())
            ],
          ),
        ],
      ),
    );
  }
}
