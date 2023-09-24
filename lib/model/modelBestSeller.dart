import 'package:tops/constants/imagePallet.dart';

class ModelBestSeller {
  final String numBest;
  final String imageBest;
  final String nameProduct;
  final String descProduct;
  final String descDetailBrand;
  final String price;

  ModelBestSeller({
    required this.numBest,
    required this.imageBest,
    required this.nameProduct,
    required this.descProduct,
    required this.descDetailBrand,
    required this.price,
  });
}

List<ModelBestSeller> listBestSeller = [
  ModelBestSeller(
    numBest: '01',
    imageBest: best0,
    nameProduct: 'Air Jordan',
    descProduct: 'Nike Air Jordan 1 Mid Chicago 2020',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '1800000',
  ),
  ModelBestSeller(
    numBest: '02',
    imageBest: best1,
    nameProduct: 'Adidas',
    descProduct: 'Adidas Ultra Boost 4.0 Running White',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '1300000',
  ),
  ModelBestSeller(
    numBest: '03',
    imageBest: best2,
    nameProduct: 'Air Jordan',
    descProduct: 'Nike Air Jordan 1 High 85 Black White',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '5500000',
  ),
  ModelBestSeller(
    numBest: '04',
    imageBest: best3,
    nameProduct: 'Adidas',
    descProduct: 'Nmd Xr1 Mastermind Japan Black White',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '2300000',
  ),
  ModelBestSeller(
    numBest: '05',
    imageBest: best4,
    nameProduct: 'Adidas',
    descProduct: 'Pharrell x adidas NMD Hu Solar',
    descDetailBrand:
        "The Air Jordan 1 High 85 “Black White” will be returning during Spring 2023 in the classic high-cut shape as a nod to 1985's OG release. Dressed in a    “Panda”like Black and Summit White color scheme. This offering of the Air Jordan 1 stays true to the OG featuring a White leather base with Black overlays.",
    price: '3500000',
  ),
];
