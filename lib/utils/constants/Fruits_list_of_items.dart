class CarouselItem {
  late String name;
  late String description;
  late String imageUrl;

  CarouselItem(this.name, this.description, this.imageUrl);
}

final fruitItems = <CarouselItem>[
  CarouselItem(
      "Apples", "2,800Dt/500g", "assets/images/productsfood/fruits/apple.jpg"),
  CarouselItem("Bananas", "4,000dt/500g",
      "assets/images/productsfood/fruits/banana.jpg"),
  CarouselItem("Cherrys ", "3,000Dt/100g",
      "assets/images/productsfood/fruits/cherrys.jpg"),
  CarouselItem("Pineapples", "14.000Dt/1kg",
      "assets/images/productsfood/fruits/pineapple.jpg"),
  CarouselItem(
      "Oranges", "1.500Dt/1kg", "assets/images/productsfood/fruits/orange.jpg"),
];
