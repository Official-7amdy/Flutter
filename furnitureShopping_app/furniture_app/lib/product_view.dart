import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget{
  @override
  _ProductViewState createState() => _ProductViewState();
  }
  class _ProductViewState extends State<ProductView> {
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
       
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Stack(
                  children:[ 
                   
                    Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: double.infinity,
                  
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft:Radius.circular(50)
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/product1.jpeg'),
                        fit: BoxFit.cover,
                        
                      ))
                  ),
                                    
                                    
                  ),
                  Column(
                    children: [
                       SizedBox(
                    height:15,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color.fromARGB(255, 255, 255, 255)
                      ),
                      child: IconButton(
                        
                        onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 0, 0, 0),))),
                   ),

                    ],
                  )
                 
                             ]               )
              ], 
             
                      ),
                      ),
                      );
                      }
}
