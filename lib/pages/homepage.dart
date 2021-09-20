
import 'package:firebase/pages/tasktwo.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:firebase/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                /*mainAxisAlignment: MainAxisAlignment.spaceBetween,*/
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 20.0,
                    ),
                  ),
                  Text(
                      "List it Out",
                    style: TextStyle(
                      fontSize: 33.0, fontWeight: FontWeight.bold, color: Color(0xFF6C63FF),
                    ),
                  ),
                  UnDraw(
                    color: Color(0xFF6C63FF),
                    width: 300,
                    height: 300,
                    illustration: UnDrawIllustration.to_do_list,
                    placeholder: Text("Illustration is loading..."), //optional, default is the CircularProgressIndicator().
                    errorWidget: Icon(Icons.error_outline, color: Colors.red, size: 25), //optional, default is the Text('Could not load illustration!').
                  ),
                  TaskCardWidget(),
               ],
              ),
              Positioned(
                bottom: 5.0,
                left: 125.0,
                child : GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoList()
                        ),
                    );
                  },

                child : Container(
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF6C63FF),
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                ),
              ),
              ),
                  /*child: Image(
                    image: AssetImage(
                      "assets/images/add_icon.png",
                    ),
                  ),*/
                  Positioned(
                    left: 167.0,
                    bottom: 23.0,
                    child : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoList()
                          ),
                        );
                      },
                    child: Container( child: Text('GET STARTED', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)),
                  ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}


