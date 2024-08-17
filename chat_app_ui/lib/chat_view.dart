import 'package:chat_app_ui/colors.dart';
import 'package:chat_app_ui/widgets/fav_contacts.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // favorite chats
          const FavContactsWidget(),

          // chats
          Expanded(
            child: Container(
              
              decoration: const BoxDecoration(
                
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )

              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,right: 8,left: 8),
                child: ListView.builder(itemBuilder :(context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                      radius: 25,
                      ),
                      title: Text('Ahmed Hamdy',
                      style: TextStyle(fontSize: 18, color:Color.fromARGB(255, 118, 23, 161),fontWeight: FontWeight.w700),),
                      subtitle: Text('Hello',
                      style: TextStyle(fontSize: 16, color: Colors.grey),),
                      trailing:Text(
                        '10:00',
                        style: TextStyle(fontSize: 16, color: Colors.grey),),
                 
                
                      );
                
                },),
              ),
            ),
          )
        ],
      ),
    );
  }
}
