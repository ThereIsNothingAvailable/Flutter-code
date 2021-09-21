import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // save data
  //final List<String> _todoList = <String>[];
  // text field
  var oneController = TextEditingController();
  var twoController = TextEditingController();
  final listToDo = FirebaseFirestore.instance.collection('todos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
        listToDo.orderBy('time_inserted', descending: false).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');

          if (snapshot.connectionState == ConnectionState.waiting)
            return (Center(
              child: CircularProgressIndicator(),
            ));
          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
              Map<String, dynamic>  data =
              document.data()! as Map<String, dynamic>;


              //print(document.id);

              return Slidable(
                key: Key(document.id),
                child: ListTile(
                  title: Text("Title :" +data["data"]),
                  /*subtitle: Text("Content: " +data["desc"]),*/
                ),
                actionPane: SlidableDrawerActionPane(),
                actions: [
                  IconSlideAction(
                    caption: 'delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => _removeTodoItem(document.id),
                  ),
                ],
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Edit',
                    color: Color(0xFF6C63FF),
                    icon: Icons.edit,
                    onTap: () => _editTodoItem(document['desc'], document.id),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
      /*ListView(children: _getItems()),
      // add items to the to-do list*/
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF6C63FF),
      ),
    );
  }

  Future<void> _addTodoItem(String title, String content) {
    return listToDo
        .add({'data': title, 'desc': content, 'time_inserted': FieldValue.serverTimestamp()});
  }

  Future<void> _edit(String update, String id) {
    return listToDo.doc(id).update({'desc': update});
  }



  void _editTodoItem(String data, String id) {
    twoController.text = data;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Edit $data'),
          content: TextField(
            controller: twoController,
            decoration: const InputDecoration(hintText: "type here"),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text('Edit'),
              onPressed: () {
                _edit(twoController.text, id);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Future<void> _removeTodoItem(String id) {
    return listToDo.doc(id).delete();
  }

  // display a dialog for the user to enter items
  Future<dynamic> _displayDialog(BuildContext context) async {
    return showDialog (
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
              title: TextField(
                controller: oneController,
                decoration: InputDecoration(
                hintText: "Enter name of task",
            ),
            ),
              content: TextField(
                controller: twoController,
               decoration: InputDecoration(
                hintText: "Enter Description for the task",
              ),
          ),
             actions: <Widget>[
            // add button
                TextButton(
                  child: const Text('ADD'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _addTodoItem(oneController.text,twoController.text);
                    oneController.clear();
                    twoController.clear();
                  },
                ),
                // Cancel button
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      }
    }