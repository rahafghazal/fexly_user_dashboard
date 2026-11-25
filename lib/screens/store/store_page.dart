import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'cart_controller.dart';
import 'cart_page.dart';
import 'store_widgets.dart';
import 'products.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      //bottomNavigationBar:AppBottomNav(currentIndex: 2),
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.82,
                ),
                itemCount: storeProducts.length,
                itemBuilder: (_, i) => _ProductCard(product: storeProducts[i]),
              ),
            ),
           const _TotalBar(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          const RoundBackButton(),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Store',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // أيقونة السلة مع البادج
          ListenableBuilder(
            listenable: cart,
            builder: (context, _) {
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryDark,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white, size: 18),
                    ),
                    if (cart.totalItems > 0)
                      Positioned(
                        right: -2,
                        top: -4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${cart.totalItems}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(product.icon,
                  size: 34, color: AppColors.textPrimary),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.lightOrange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              product.category,
              style: const TextStyle(fontSize: 9, color: AppColors.orange),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.price.toStringAsFixed(0)} $kCurrency',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary),
              ),
              InkWell(
                onTap: () => cart.add(product),
                customBorder: const CircleBorder(),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryDark,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalBar extends StatelessWidget {
  const _TotalBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: ListenableBuilder(
        listenable: cart,
        builder: (context, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total(${cart.totalItems} items)',
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textSecondary),
                  ),
                  Text(
                    '${cart.totalPrice.toStringAsFixed(2)} $kCurrency',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.verified_user, color: AppColors.green, size: 16),
                  SizedBox(width: 4),
                  Text('Secure checkout',
                      style: TextStyle(fontSize: 12, color: AppColors.green)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}