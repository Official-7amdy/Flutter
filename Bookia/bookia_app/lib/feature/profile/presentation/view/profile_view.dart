import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/profile/presentation/widgets/profile_options.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: getTitleTextStyle()),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_rounded,
                color: AppColors.redColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/ahmed.jpg'),
                ),
                SizedBox(height: 20),
                Text('Ahmed Hamdy', style: getTitleTextStyle()),
                Text('ahmedhaboelela34@gmail.com', style: getSmallTextStyle()),
                profile_options(
                  HeadText: 'My Orders',
                  SubText: 'Already have 10 orders',
                ),
                profile_options(
                  HeadText: 'Shipping Addresses',
                  SubText: 'Egypt, Suez',
                ),
                profile_options(
                  HeadText: 'Payment Method',
                  SubText: 'You have 2 cards',
                ),
                profile_options(
                  HeadText: 'Settings',
                  SubText: 'Notification, Password, FAQ...',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
