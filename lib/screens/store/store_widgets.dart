import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';

/// شريط التنقل السفلي المشترك بين الصفحتين
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, this.currentIndex = 2});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textPrimary,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: (_) {}, // اربطها مع التنقل عندك
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: 'My Requestes'),
        BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Store'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

/// زر الرجوع الدائري
class RoundBackButton extends StatelessWidget {
  const RoundBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.maybePop(context),
      customBorder: const CircleBorder(),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
        ),
        child: const Icon(Icons.arrow_back_ios_new,
            size: 14, color: AppColors.textPrimary),
      ),
    );
  }
}