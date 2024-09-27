import 'package:bookia_app/core/customWidgets/sucessDialog.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/profile/presentation/widgets/profile_options.dart';
import 'package:bookia_app/feature/welcome_screen.dart';
import 'package:bookia_app/services/local_storage.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetProfileEvent());
  }

  // Refactored logout function for better readability
  void _logout() {
    // Trigger the Logout event using AuthBloc
    context.read<AuthBloc>().add(LogoutEvent());

    // Delete token from local storage
    LocalStorage.deleteData(key: LocalStorage.token);

    // Navigate to WelcomeScreen
    pushAndRemoveUntil(context, const WelcomeScreen());
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
              // Call the refactored logout function
              _logout();
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is LogoutLoadingState) {
            showLoadingDialog(context: context);
          } else if (state is LogoutFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something Went Wrong'),
                backgroundColor: AppColors.redColor,
              ),
            );
          }
        },
        builder: (context, state) {
           if (state is LogoutLoadingState) {
            showLoadingDialog(context: context);
          } else if (state is LogoutSuccessState) {
            // Handle success (redirect, show message, etc.)
            void logout(){
                context.read<AuthBloc>().add(LogoutEvent());
              pushAndRemoveUntil(context, const WelcomeScreen());
              // Delete token from cache
              LocalStorage.deleteData(key: LocalStorage.token);

            }
          } else if (state is LogoutFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something Went Wrong'),
                backgroundColor: AppColors.redColor,
              ),
            );
          }
          if (state is GetProfileLoadedState) {
            var profile = context.read<HomeBloc>().getProfileResponseModel?.data;
            return _buildProfileContent(profile);
          } else if (state is GetProfileLoadingState) {
            return _buildLoadingIndicator();
          } else {
            return _buildErrorState();
          }
          
        },
      ),
    );
  }

  // Helper method to build profile content
  Widget _buildProfileContent(profile) {
    return SingleChildScrollView(
      child: Container(
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
      ),
    );
  }

  // Helper method for loading indicator
  Widget _buildLoadingIndicator() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: LottieBuilder.asset(AppAssets.searching),
      ),
    );
  }

  // Helper method to show error or fallback state
  Widget _buildErrorState() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: LottieBuilder.asset(AppAssets.animatedError),
      ),
    );
  }
}
