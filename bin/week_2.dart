import 'dart:io';

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

  void showProducts() {
    for (var product in products) {
      print(product.name);
    }
  }

  void showTotal() {
    var productNames = products.map((e) => e.name).join(', ');  
    print('장바구니에 $productNames 총 $totalPrice원입니다!');
  }

}

void main(List<String> arguments) {
      List<Product> products = [
      Product('셔츠', 45000),
      Product('원피스', 30000),
      Product('반팔티', 35000),
      Product('반바지', 38000),
      Product('양말', 5000)
    ];

    var shoppingMall = ShoppingMall();
    int input = 0;

  while (true) {
    print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 /[6] 장바구니 초기화" );
    input = int.parse(stdin.readLineSync()!);

    if (input == 1) { // 상품목록보기
      for (var product in products) {
      print('${product.name} / ${product.price}원');
      }
    }

    if (input == 2) { // 장바구니 담기
      try {
      print("장바구니에 담을 상품을 선택해주세요.");

      for (var i = 0; i < products.length; i++) {
        print('[$i] ${products[i].name} / ${products[i].price}원');
      }
      var selectedIndex = int.parse(stdin.readLineSync()!);

      if (selectedIndex < 0 || selectedIndex >= products.length) {
        throw RangeError('Invalid index');
      }

      print("몇 개를 담으시겠어요?");
      var quantity = int.parse(stdin.readLineSync()!);

      if (quantity <= 0) {
        throw ArgumentError('Invalid quantity');
      }

      for (var i = 0; i < quantity; i++) {
        shoppingMall.addToCart(products[selectedIndex]);
      }
      } on FormatException {
      print("입력값이 올바르지 않아요");
      } on ArgumentError {
      print("0개보다 많은 개수의 상품만 담을 수 있어요!");
      } catch (e) {
      print("입력값이 올바르지 않아요");
      }
    }

    if(input == 3){ // 장바구니 담긴 상품 총 가격 보기
      shoppingMall.showProducts();
      shoppingMall.showTotal();
    }

    if(input ==4){ // 프로그램 종료
      print("정말 종료하시겠습니까?");
      input = int.parse(stdin.readLineSync()!);
      if(input == 5){
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요!");
        break;
      } else{
        print("종료하지 않습니다.");
      }
    }
    if(input == 6){ // 장바구니 초기화
      if (shoppingMall.products.isEmpty) {
      print("이미 장바구니가 비어있습니다.");
      } else {
      shoppingMall.products.clear();
      shoppingMall.totalPrice = 0;
      print("장바구니가 초기화 되었습니다.");
      }
    }
  }
}
