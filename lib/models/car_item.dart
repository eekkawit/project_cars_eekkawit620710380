class CarItem {
  final int id;
  final String name;
  final int price;
  final String image;

  CarItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory CarItem.fromJson(Map<String, dynamic> json) {
    return CarItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }

  CarItem.fromJson2(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        image = json['image'];

  @override
  String toString() {
    return '$id: $name ราคา $price บาท';
  }
}