
import 'package:fixly_app/screens/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'package:fixly_app/widgets/home_widgets.dart';
import '../bottom_nav.dart';
import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                HomeHeader(),

                SizedBox(height: 22),

                WelcomeSection(),

                SizedBox(height: 22),

                AssistantBanner(),

                SizedBox(height: 28),

              const SectionTitle(
                title: 'Find the right maintenance service',
                subtitle: 'What do you need help with today?',
              ),

               SizedBox(height: 16),

                ServiceSection(),

                SizedBox(height: 18),

                EmergencySection(),

                //SizedBox(height: 18),

                //MobileWorkshopSection(),

                SizedBox(height: 25),

                SectionTitle(
                title: 'Your activity',
                subtitle: 'Keep track of your maintenance',
              ),

                SizedBox(height: 14),

                QuickActionsSection(),

                SizedBox(height: 25),
            ],
          ),
        ),
      ),

      bottomNavigationBar: FlexyBottomNavigation(
        selectedIndex: selectedIndex,
      onTap: (index) {
  if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  } else {
    if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StorePage(),
      ),
    );
  } else{ setState(() {
      selectedIndex = index;
    });}
  
  }
},

      ),
    );
  }
}
