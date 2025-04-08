class ProductModel {
  int? id;
  String? title;
  int? price;
  int? discount;
  String? specialExpiration;
  int? discountPrice;
  int? productCount;
  String? category;
  String? brand;
  String? image;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.discount,
      this.specialExpiration,
      this.discountPrice,
      this.productCount,
      this.category,
      this.brand,
      this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discount = json['discount'];
    specialExpiration = json['special_expiration'];
    discountPrice = json['discount_price'];
    productCount = json['product_count'];
    category = json['category'];
    brand = json['brand'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['discount'] = discount;
    data['special_expiration'] = specialExpiration;
    data['discount_price'] = discountPrice;
    data['product_count'] = productCount;
    data['category'] = category;
    data['brand'] = brand;
    data['image'] = image;
    return data;
  }
}
