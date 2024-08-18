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
                SizedBox(
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


                )
              ], 
             
                      ),
                      ),
                      );
                      }
}

class ProductList {
}