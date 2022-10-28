import 'package:flutter/material.dart';

class List_and_grid extends StatelessWidget {
  const List_and_grid({ required this.names});
  final String names;
  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                                children: [
                              Text(names,style: TextStyle(color: Color(0xff2c3651),fontSize: 20,fontWeight: FontWeight.bold),),
                                ],
                              ),
                      );
  }
}
class Grid_view extends StatelessWidget {
  const Grid_view({ required this.images,required this.doller,required this.names});
  final String images;
  final String doller;
  final String names;
 

  @override
  Widget build(BuildContext context) {
    return Row( 
                        children: [
                          Container(
                            height: 230,
                            width: 154,
                            decoration: BoxDecoration(
                              border: Border.all(
                              color: Color.fromARGB(255, 205, 205, 204), //                   <--- border color
                               width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            color: Color(0xffFFFFFF),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  //alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [Text(doller,style: TextStyle(color: Color(0xff121212),fontSize: 14,fontWeight: FontWeight.bold),),
                                          SizedBox(width: 80,),
                                          Icon(Icons.favorite_border_outlined),],
                                        ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            child: Center(child: Image.network(images,width: 90,height: 90,)),
                                          ),
                                          SizedBox(height: 20,),
                                         Text(names,style: TextStyle(color: Color(0xff2c3651),fontSize: 20,fontWeight: FontWeight.bold),),
                                         Text('Categories',style: TextStyle(color: Color(0xff2c3651),fontSize: 20,fontWeight: FontWeight.bold),),
                                      ], 
                                    ),
                                  ),
                                  
                                )
                              ],
                            ),
                          ),
                          
                        ],
                      );
  }
}