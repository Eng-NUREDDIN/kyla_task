
///The main entity for my bag item.
class MyBagItemEntity {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  int count;

  MyBagItemEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrl,
      required this.count});
}
