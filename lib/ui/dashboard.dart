import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Expanded(
            flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Card(
                          child: Center(
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Column(
                                children: [
                                  Text('Members'),
                                  Text('80',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                                ],
                              ),
                            ),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Card(
                          child: Center(
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Column(
                                children: [
                                  Text('Members'),
                                  Text('80',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                                ],
                              ),
                            ),
                          )))
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Card(
                      child: Center(
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Column(
                            children: [
                              Text('Members'),
                              Text('80',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                            ],
                          ),
                        ),
                      ))),
              Expanded(
                  flex: 1,
                  child: Card(
                      child: Center(
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Column(
                            children: [
                              Text('Members'),
                              Text('80',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                            ],
                          ),
                        ),
                      )))
            ],
          )),
         Expanded(
             flex: 1,
             child:  Row(
           children: [
             Expanded(
                 flex: 1,
                 child: Card(
                     child: Center(
                       child: SizedBox(
                         height: 80,
                         width: 80,
                         child: Column(
                           children: [
                             Text('Members'),
                             Text('80',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                           ],
                         ),
                       ),
                     ))),
             Expanded(
                 flex: 1,
                 child: Card(
                     child: Center(
                       child: SizedBox(
                         height: 80,
                         width: 80,

                         child: Column(
                           children: [
                             Text('Members'),
                             Text('80',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                           ],
                         ),
                       ),
                     ),
                 ))
           ],
         ))
        ],
      ),
    );
  }
}
