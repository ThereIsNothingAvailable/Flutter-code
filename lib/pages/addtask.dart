
import 'package:firebase/taskwidgets.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        top: 24.0,
                        bottom: 6.0,
                      ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            print("Go back to task page");
                          },

                            child : Padding(
                                padding: const EdgeInsets.all(24.0),
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/back_arrow_icon.png"
                                    ),
                                 ),
                            ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value){
                              print("field value : $value");
                          },
                            decoration: InputDecoration(
                              hintText: "Enter Task Title",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                       bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Description for the task",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                      ),
                    ),
                  ),
                  TodoWidget(
                    text: "Create your first task",
                    isDone: false,
                  ),
                  TodoWidget(
                    text: "Create your first TODO",
                    isDone: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskPage()
                      ),
                    );
                  },

                  child : Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/delete_icon.png",
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      ),
    );
  }
}
