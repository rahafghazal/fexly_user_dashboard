import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'cart_controller.dart';
import 'store_widgets.dart';
import 'products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: cart,
          builder: (context, _) {
            final items = cart.items;
            return Column(
              children: [
                // ===== الهيدر =====
                Container(
                  color: AppColors.surface,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      const RoundBackButton(),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Shopping Cart',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
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
                    ],
                  ),
                ),

                // ===== القائمة =====
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
                    children: [
                      const Text(
                        'Shopping Cart',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark),
                      ),
                      const SizedBox(height: 16),
                      if (items.isEmpty)
                        const Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: Center(
                            child: Text('Your cart is empty',
                                style: TextStyle(
                                    color: AppColors.textSecondary)),
                          ),
                        )
                      else
                        ...items.map((item) => _CartItemCard(item: item)),
                    ],
                  ),
                ),

                // ===== المجموع + زر الدفع =====
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.border)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total(${cart.totalItems}items)',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textSecondary),
                            ),
                            Text(
                              '${cart.totalPrice.toStringAsFixed(2)} $kCurrency',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: items.isEmpty
                              ? null
                              : () {
                                  // TODO: اربطها بصفحة الدفع
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Proceeding to checkout...')),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                          ),
                          child: const Text(
                            'Proceed to Check out',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;
  const _CartItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final product = item.product;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.lightOrange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(product.icon, size: 18, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.lineTotal.toStringAsFixed(2)} $kCurrency',
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => cart.remove(product),
                child: const Icon(Icons.delete, color: AppColors.red, size: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _QtyButton(
                    icon: Icons.remove,
                    onTap: () => cart.decrement(product),
                  ),
                  SizedBox(
                    width: 28,
                    child: Text(
                      '${item.quantity}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.textPrimary),
                    ),
                  ),
                  _QtyButton(
                    icon: Icons.add,
                    onTap: () => cart.add(product),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 15, color: AppColors.textPrimary),
      ),
    );
  }
}