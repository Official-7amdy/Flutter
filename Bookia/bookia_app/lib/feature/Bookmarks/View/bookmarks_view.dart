import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/feature/Bookmarks/Widgets/bookmarkAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookmarksView extends StatefulWidget {
  const BookmarksView({super.key});

  @override
  State<BookmarksView> createState() => _BookmarksViewState();
}

class _BookmarksViewState extends State<BookmarksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookmarkAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: 2, // You can dynamically change the item count here
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 3, color: Colors.grey[300]);
          },
          itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    width: 120,
                    height: 150,
                    'https://picsum.photos/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12), // Add spacing between the image and text
                 Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          const Text(
                            'Book Title',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8), // Add some space between title and author
                          const Text(
                            'Book Author',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Book Description',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(context,onPressed:(){} , text: 'Add To Cart',width: 200,hight: 40,),
                              ],
                            )
                      
                         
                        ],
                      ),
                  
                      IconButton(onPressed: () {  },
                   icon:  const Icon(Icons.remove_circle_outline_rounded,color: AppColors.redColor,),),
                   
                   
                    ],
                  ),
                ),
                
              
              ],
            );
          },
        ),
      ),
    );
  }
}
