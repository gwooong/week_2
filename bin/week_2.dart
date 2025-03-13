import 'package:week_2/week_2.dart' as week_2;



class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [];
  int totalPrice = 0;
  
  void addToCart(Product product) {
    products.add(product);
    totalPrice += product.price;
  }

  void removeToCart(Product product) {
    products.remove(product);
    totalPrice -= product.price;
  }

  void showProducts() {
    for (var product in products) {
      print(product.name);
    }
  }

  void showTotal() {
    print('Total price: $totalPrice');
  }

}

void main(List<String> arguments) {
  var shoppingMall = ShoppingMall();

  shoppingMall.addToCart(Product('셔츠', 45000));
  shoppingMall.addToCart(Product('원피스', 30000));
  shoppingMall.addToCart(Product('반팔티', 35000));
  shoppingMall.addToCart(Product('반바지', 38000));
  shoppingMall.addToCart(Product('양말', 5000));

  shoppingMall.showProducts();
  shoppingMall.showTotal();

}
