class CardModel {
  final String title;
  final String image;
  final int price;
  int total;
  final String? description;
  final String? size;
  int itemCount;

  CardModel(
      {required this.description,
      required this.size,
      required this.title,
      required this.image,
      required this.price,
      required this.itemCount,
      required this.total});
}
