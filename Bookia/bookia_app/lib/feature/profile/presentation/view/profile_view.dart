import 'package:bookia_app/core/customWidgets/sucessDialog.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/profile/presentation/widgets/profile_options.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetProfileEvent());
        context.read<AuthBloc>().add(LogoutEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: getTitleTextStyle()),
        actions: [
          IconButton(
            onPressed: () {
              // Add your logout logic here
              context.read<AuthBloc>().add(LogoutEvent());

            },
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              // TODO: implement listener (e.g., error handling)
              if (state is LogoutLoadingState){
                // Show a loading indicator
                showLoadingDialog(context: context);
              }
             
            },
            builder: (context, state) {
              var profile = context.read<HomeBloc>().getProfileResponseModel?.data;

              // Check if profile is null or still loading
          if(state is GetProfileLoadedState){
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: profile?.image != null 
                        ? CachedNetworkImageProvider(profile!.image!)
                        : const AssetImage(AppAssets.animatedUser) as ImageProvider,
                    ),
                    const SizedBox(height: 20),
                    Text(profile!.name.toString(), style: getTitleTextStyle()),
                    Text(profile.email.toString(), style: getSmallTextStyle()),
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
              );
                  }
                  else if(state is GetProfileLoadingState){
                    return   Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: LottieBuilder.asset(
                  AppAssets.searching,
                ),
              ),
            );
                    } else{
                       return Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: LottieBuilder.asset(
                  AppAssets.searching,
                ),
              ),
            );
                    }

            },
          ),
        ),
      ),
    );
  }
}
