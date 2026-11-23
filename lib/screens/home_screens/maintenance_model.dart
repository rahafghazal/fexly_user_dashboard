import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
//import 'package:fixly_app/screens/home_screens/service_details_page.dart';
import 'package:fixly_app/screens/1-9/service_details_page.dart';

class MaintenanceService {
  final String title;
  final String subtitle;
  final IconData icon;

  const MaintenanceService({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

const List<MaintenanceService> homeServices = [
  MaintenanceService(
    title: 'Plumbing',
    subtitle: 'Leaks, pipes & water fixtures.',
    icon: Icons.plumbing,
  ),
  MaintenanceService(
    title: 'Electrical Repair',
    subtitle: 'Safe solutions for your home.',
    icon: Icons.electrical_services,
  ),
  MaintenanceService(
    title: 'Air Conditioning',
    subtitle: 'Cooling, servicing & installation.',
    icon: Icons.ac_unit,
  ),
  MaintenanceService(
    title: 'Carpentry',
    subtitle: 'Doors, furniture & fittings.',
    icon: Icons.handyman,
  ),
  MaintenanceService(
    title: 'Painting',
    subtitle: 'A fresh finish for every room.',
    icon: Icons.format_paint,
  ),
  MaintenanceService(
    title: 'Home Appliance Repair',
    subtitle: 'Keep everyday essentials working.',
    icon: Icons.kitchen,
  ),
  MaintenanceService(
    title: 'General Maintenance',
    subtitle: 'Small repairs, expert care.',
    icon: Icons.home_repair_service,
  ),
];

const List<MaintenanceService> automotiveServices = [
  MaintenanceService(
    title: 'Engine Repair',
    subtitle: 'Diagnostics & engine care',
    icon: Icons.settings,
  ),
  MaintenanceService(
    title: 'Battery Service',
    subtitle: 'Battery testing, charging and replacement.',
    icon: Icons.battery_charging_full,
  ),
  MaintenanceService(
    title: 'Tire Repair',
    subtitle: 'punctures, balancing & replacement',
    icon: Icons.tire_repair,
  ),
  MaintenanceService(
    title: 'Electrical problems',
    subtitle: 'Vehicle electrical diagnostics.',
    icon: Icons.electrical_services,
  ),
  MaintenanceService(
    title: 'General Car Repair',
    subtitle: 'Complete vehicle maintenance.',
    icon: Icons.car_repair,
  ),
];

class MaintenanceCategoryPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<MaintenanceService> services;

  const MaintenanceCategoryPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 25),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];

                
return InkWell(
  borderRadius: BorderRadius.circular(18),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ServiceDetailsPage(
          categoryTitle: title,
          service: service,
        ),
      ),
    );
  },
  
  child: Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: AppColors.border),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: 0.035),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            service.icon,
            color: AppColors.primary,
            size: 26,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          service.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          service.subtitle,
          style: const TextStyle(
            fontSize: 11,
            height: 1.4,
            color: AppColors.textSecondary,
          ),
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
