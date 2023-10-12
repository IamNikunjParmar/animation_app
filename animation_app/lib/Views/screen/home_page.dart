import 'dart:developer';

import 'package:animation_app/Controllers/animal_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;


    return Consumer<AnimalController>(
      builder: (context,pro,_) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              pro.myColor = Colors.grey;
              pro.myRandom();
            },
            child: Icon(Icons.navigate_next,size: 45),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 867,
                child: Image.asset("assets/gif/bg theme.png",
                  fit: BoxFit.cover
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<AnimalController>(
                  builder: (context,pro,_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Visibility(
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: pro.allData
                                  .map(
                                    (e) => Draggable(
                                data:e,
                                feedback: Container(
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height: h * 0.05,
                                  width: w * 0.3,
                                  child:  Text(
                                    e.toString().toUpperCase(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 23,

                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade800,
                                          blurRadius: 3,
                                          offset: Offset(2,2)
                                      ),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: h * 0.05,
                                  width: w * 0.3,
                                  alignment: Alignment.center,
                                  child:  Text(
                                    e.toString().toUpperCase(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade800,
                                          blurRadius: 3,
                                          offset: Offset(2,2)
                                      ),
                                    ],
                                  ),
                                ),
                                childWhenDragging: Container(),
                              ),
                              ).toList(),
                            ),
                            scrollDirection: Axis.horizontal,
                          ),

                        ),

                        const SizedBox(
                          height: 328,
                        ),
                        DragTarget(
                            onAccept: (data){
                              log("A-Data:$data");
                              pro.myColor = Colors.transparent;
                            },
                            onWillAccept: (data){

                              log("Data:$data");
                              return data == pro.allData[pro.index];
                            },

                            builder: (ctx,_,__){
                              return Stack(
                                  children:[
                                    Image.asset('assets/images/${pro.allData[pro.index]}.png',
                                      alignment: Alignment.center,
                                      height: 300,
                                      width: 400,
                                    ),
                                    Image.asset('assets/images/${pro.allData[pro.index]}.png',
                                      color: pro.myColor,
                                      alignment: Alignment.center,
                                      height: 300,
                                      width: 400,
                                    ),
                                  ]
                              );

                            }),

                      ],
                    );
                  }
                ),
              ),
            ],
          ),

        );
      }
    );
  }
}

