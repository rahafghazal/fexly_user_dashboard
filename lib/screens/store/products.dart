import 'package:flutter/material.dart';

/// العملة المستخدمة بكل التطبيق
const String kCurrency = 'JOD';

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final IconData icon;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
  });
}

/// ===== بضاعة المتجر =====
/// لإضافة منتج جديد: انسخ سطر Product وغيّر القيم (id لازم يكون مميز).
/// لحذف منتج: احذف السطر الخاص فيه.
const List<Product> storeProducts = [
  Product(
    id: 'p1',
    name: 'Car Battery 70Ah',
    category: 'Auto',
    price: 89,
    icon: Icons.directions_car_outlined,
  ),
  Product(
    id: 'p2',
    name: 'Faucer Washer Kit',
    category: 'Auto',
    price: 6,
    icon: Icons.build_outlined,
  ),
  Product(
    id: 'p3',
    name: 'LED Bulb Pack x4',
    category: 'Auto',
    price: 12,
    icon: Icons.build_outlined,
  ),
  Product(
    id: 'p4',
    name: 'Tire Repair Kit',
    category: 'Auto',
    price: 24,
    icon: Icons.directions_car_outlined,
  ),
];