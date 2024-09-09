import 'package:bookia_app/core/customWidgets/appBottomNavigationBar.dart';
import 'package:bookia_app/feature/Bookmarks/Widgets/bookmarkAppBar.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
