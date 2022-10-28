import 'package:flutter/material.dart';

class Add_page extends StatefulWidget {
  const Add_page({ Key? key }) : super(key: key);

  @override
  State<Add_page> createState() => _Add_pageState();
}

class _Add_pageState extends State<Add_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                        children: [
                          TextField(
                          //controller: productController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail,color: Color(0xffFC7508),),
                          labelText: 'PRODUCT',
                          border: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Enter productname',
                          
                        ),
                      ),
                      SizedBox(height: 25,),
                      TextField(
                        //controller: descriptionController,
                        //obscureText: true,
                        decoration: InputDecoration(
                          
                          prefixIcon: Icon(Icons.person,color: Color(0xffFC7508),),
                          labelText: 'DESCRIPTION',
                          border: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Enter description',
                          
                        ),
                      ),
                      // Container(
                      //   child: image==null?Center(child: Text('Pick image'),),
                      // ),
                      // Container(
                      //   child: Center(child: Image.file(
                      //     File(image!.Path).absolute,
                      //     height: 100,
                      //     width: 100,
                      //     fit: BoxFit.cover,
                      //     )),
                      // ),
                      
      
                    SizedBox(height: 10,),
      
                      ElevatedButton(onPressed: (() {
                        // getImage();
                         
                     
                   }), 
                   child: Text('Add product')),
                   SizedBox(height: 200,),
      
                   ElevatedButton(onPressed: (() {
                       
                  //performLogin();
                   
                   }), 
                   child: Text('Upload'))
            ],
          ),
              ),
            ]
          ),
        ),
      )
    );
  }
}