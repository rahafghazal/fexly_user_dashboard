
import 'package:fixly_app/screens/home_screens/ai_assistant.dart';
import 'package:fixly_app/screens/home_screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'package:fixly_app/screens/home_screens/maintenance_model.dart';
import 'package:flutter/rendering.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              'Flexy',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 37,
                fontWeight: FontWeight.w900,
                letterSpacing: -1,
              ),
            ),
            SizedBox(width: 188,),
            IconButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPage(),
              ),
                      );}, icon:Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.textPrimary,
                  size: 27,
                ),),
          ],
        ),
      ),
    );
  }
}

// WELCOME SECTION
class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  //👋
                  'Welcome !',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 99,),
                  Icon(
              Icons.location_on_outlined,
              color: AppColors.textPrimary,
              size: 20,
            ),
            
              SizedBox(width: 5),
            
              Text(
              'Your Location',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            
              SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// SECTION TITLE
class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}


// FLEXy ASSISTANT

class AssistantBanner extends StatelessWidget {
  const AssistantBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1748E8),
              Color(0xFF102D83),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AiAssistant(),
            ),
                    );}, icon:Icon(
                Icons.smart_toy_rounded,
                color: Colors.white,
                size: 27,
              ),),
            ),

            const SizedBox(width: 13),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meet Flexy AI Assistant',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Get smart maintenance recommendations.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
 IconButton(onPressed: (){ Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AiAssistant(),
            ),
                    );}, icon: Icon(
              Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 17,
              ),),
          ],
        ),
      ),
    );
  }
}

// SERVICE CARD

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 27,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

// SERVICE SECTION

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MaintenanceCategoryPage(
                    title: 'Home Maintenance',
                    subtitle: 'A little care. A lot of peace of mind.',
                    services: homeServices,
                  ),
                ),
              );
            },
            child: const ServiceCard(
              title: 'Home Maintenance',
              subtitle: 'Plumbing, electrical, AC and more',
              icon: Icons.home_repair_service_rounded,
              iconColor: AppColors.primary,
              iconBackground: AppColors.lightBlue,
            ),
          ),

          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MaintenanceCategoryPage(
                    title: 'Automotive Maintenance',
                    subtitle: 'Keep your journey smooth and safe.',
                    services: automotiveServices,
                  ),
                ),
              );
            },
            child: const ServiceCard(
              title: 'Automotive Maintenance',
              subtitle: 'Car repair and vehicle services',
              icon: Icons.directions_car_rounded,
              iconColor: AppColors.orange,
              iconBackground: AppColors.lightOrange,
            ),
          ),
        ],
      ),
    );
  }
}


// --------------------------------------------------
// EMERGENCY SECTION
// --------------------------------------------------

class EmergencySection extends StatelessWidget {
  const EmergencySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: AppColors.lightPink,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: AppColors.red.withValues(alpha: 0.15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.emergency_rounded,
                color: AppColors.red,
                size: 28,
              ),
            ),

            const SizedBox(width: 13),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emergency Assistance',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Need urgent help? We are here.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.red,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
/*
// --------------------------------------------------
// MOBILE WORKSHOP
// --------------------------------------------------

class MobileWorkshopSection extends StatelessWidget {
  const MobileWorkshopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.local_shipping_rounded,
                color: AppColors.primary,
                size: 29,
              ),
            ),

            const SizedBox(width: 14),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Workshop',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Professional service at your doorstep.',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}*/

// --------------------------------------------------
// QUICK ACTION CARD
// --------------------------------------------------

class QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 19,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 27,
              color: AppColors.primary,
            ),

            const SizedBox(height: 9),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// QUICK ACTIONS SECTION
// --------------------------------------------------

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          QuickActionCard(
            title: 'My Requests',
            icon: Icons.assignment_outlined,
          ),

          SizedBox(width: 12),

          QuickActionCard(
            title: 'Maintenance History',
            icon: Icons.history_rounded,
          ),
        ],
      ),
    );
  }
}
