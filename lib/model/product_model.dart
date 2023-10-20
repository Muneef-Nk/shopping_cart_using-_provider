class ProductModel {
  final String name;
  final String image;
  final int price;

  ProductModel({required this.name, required this.image, required this.price});
}

List<ProductModel> product = [
  ProductModel(
    name: "Jones T-shirts",
    image:
        "https://www.jiomart.com/images/product/original/rvhrrz2v4w/leotude-oversized-cottonblend-half-sleeve-t-shirt-for-men-s-product-images-rvhrrz2v4w-0-202309021639.png?im=Resize=(330,410)",
    price: 1400,
  ),
  ProductModel(
    name: "Adidas",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvVpTXLIkGhUFE_LQNyUzxe_f5sAx0nDKerVwXdCHI9-DUfzWrrMoUdGfQx7MPnmsNzk&usqp=CAU",
    price: 2100,
  ),
  ProductModel(
    name: "Diesel T-shirts",
    image:
        "https://ttbazaar.com/cdn/shop/products/TS078_LEMON_FRONT.jpg?v=1623062001",
    price: 2900,
  ),
  ProductModel(
    name: "Calvin Klein",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz0IUGqnfU47lXfiCJJEI1M6xSN2nBXdZVJQ&usqp=CAU",
    price: 1200,
  ),
  ProductModel(
    name: "Arrow",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmxFCFGnfqCFLKMHzzrHQkniTSd7HgUsSNhg&usqp=CAU",
    price: 2500,
  ),
  ProductModel(
    name: "Allen Solly",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQBdXbrEIQO6A4MDD-Ee7JYQMTyjFJfk62OA&usqp=CAU",
    price: 1800,
  ),
  ProductModel(
    name: "Henley neck",
    image:
        "https://www.levi.in/dw/image/v2/BBRC_PRD/on/demandware.static/-/Sites-LeviMaster-Catalog/en_IN/dw34f0cac4/images/hi-res/169600124/169600124_01_Front.jpg?sw=334&sh=445",
    price: 2000,
  ),
  ProductModel(
    name: "U.S. Polo Assn",
    image:
        "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/82c9e88365974c4eab8baebb0158d719_9366/brandlove-tee.jpg",
    price: 2800,
  ),
];
