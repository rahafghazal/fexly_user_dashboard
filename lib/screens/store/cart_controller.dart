import 'package:flutter/foundation.dart';
import 'products.dart';

class CartItem {
  final Product product;
  int quantity;
  CartItem(this.product, this.quantity);

  double get lineTotal => product.price * quantity;
}

/// حالة السلة (مشتركة بين صفحة المتجر وصفحة السلة)
class CartController extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  /// عدد القطع الكلي (للبادج على أيقونة السلة)
  int get totalItems =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.values.fold(0.0, (sum, item) => sum + item.lineTotal);

  bool get isEmpty => _items.isEmpty;

  void add(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product, 1);
    }
    notifyListeners();
  }

  void decrement(Product product) {
    final item = _items[product.id];
    if (item == null) return;
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(product.id);
    }
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

/// نسخة وحيدة مشتركة بكل التطبيق
final CartController cart = CartController();