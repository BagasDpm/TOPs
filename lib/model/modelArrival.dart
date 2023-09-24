class ModelArrival {
  final String image;
  final String nameBrand;
  final String descBrand;
  final String descDetailBrand;
  final String price;

  ModelArrival({
    required this.image,
    required this.nameBrand,
    required this.descBrand,
    required this.descDetailBrand,
    required this.price,
  });
}

List<ModelArrival> listDataArrival = [
  ModelArrival(
    image: 'assets/images/arrival0.png',
    nameBrand: 'air jordan'.toUpperCase(),
    descBrand: 'Air Jordan 1 High 85 Black White',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '5500000',
  ),
  ModelArrival(
    image: 'assets/images/arrival1.png',
    nameBrand: 'adidas'.toUpperCase(),
    descBrand: "Women's Forum Low Off-White",
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '1800000',
  ),
  ModelArrival(
    image: 'assets/images/arrival2.png',
    nameBrand: 'adidas'.toUpperCase(),
    descBrand: 'NMD R1 Shoes Core Black',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '2300000',
  ),
  ModelArrival(
    image: 'assets/images/arrival3.png',
    nameBrand: 'converse'.toUpperCase(),
    descBrand: 'Custom Chuck Taylor All Star Lift Platform Canvas By You',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '1300000',
  ),
  ModelArrival(
    image: 'assets/images/arrival4.png',
    nameBrand: 'new balance'.toUpperCase(),
    descBrand: 'New Balance 550 Lunar New Year',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '3500000',
  ),
];
