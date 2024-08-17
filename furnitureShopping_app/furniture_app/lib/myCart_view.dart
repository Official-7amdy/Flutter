import 'package:flutter/material.dart';

class MycartView extends StatefulWidget{
  const MycartView({super.key});
  @override
  _MycartViewState createState() => _MycartViewState();
  }
  class _MycartViewState extends State<MycartView> {
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('My Cart',style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back_ios)),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Product $index'),
                      subtitle: Text('Price: \$${index * 10}'),
                      trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.delete)),
                      );
                      }
                      ),
                      ),

            ],
          ),

        
      );}






}

