import 'package:bookia_app/core/customWidgets/appBottomNavigationBar.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/presentation/Widgets/bookList.dart';
import 'package:bookia_app/feature/Home/presentation/Widgets/homeCarousel.dart';
import 'package:bookia_app/feature/Home/presentation/Widgets/homeHeader.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()
          ..add(GetSliderEvent())
          ..add(GetBestSellerEvent()),
        ),
       
      ],
      child: Scaffold(
        appBar: homeHeader(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeCarousel(),
                const Gap(20),
                Text('Best Seller', style: getTitleTextStyle(fontSize: 26)),
                const Gap(10),
                // Wrap ListView.builder in Expanded
                const BookList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
