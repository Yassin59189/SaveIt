class CarouselItem {
  late String name;
  late String description;
  late String imageUrl;

  CarouselItem(this.name, this.description, this.imageUrl);
}

final sampleItems = <CarouselItem>[
  CarouselItem("Cherry Tomatoes", "3,000Dt/250g",
      "assets/images/productsfood/vegis/Tomato.png"),
  CarouselItem(
      "Lettuce", "1,000dt/1pc", "assets/images/productsfood/vegis/Latus.png"),
  CarouselItem("Carrots ", "2,000Dt/1pc",
      "assets/images/productsfood/vegis/carrott.jpg"),
  CarouselItem(
      "Onions", "2,500Dt/1pc", "assets/images/productsfood/vegis/onion.jpeg"),
  CarouselItem(
      "Potatos", "3,200Dt/1kg", "assets/images/productsfood/vegis/potatos.jpg"),
];
