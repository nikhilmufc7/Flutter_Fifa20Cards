import 'package:meta/meta.dart';

class NationModel {
  final String nationName;
  final String imagePath;
  final String countryId;

  NationModel(
      {@required this.nationName,
      @required this.imagePath,
      @required this.countryId});
}

List<NationModel> nations = [
  NationModel(
      nationName: "Argentina",
      imagePath:
          "https://i.pinimg.com/originals/33/e4/6c/33e46c5302d6d4038b47e13f8357b042.jpg",
      countryId: "52"),
  NationModel(
      nationName: "Brazil",
      imagePath:
          "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1280px-Flag_of_Brazil.svg.png",
      countryId: "54"),
  NationModel(
      nationName: "Germany",
      imagePath:
          "https://www.worldatlas.com/r/w1200-h701-c1200x701/upload/63/3f/7a/untitled-design-281.jpg",
      countryId: "21"),
  NationModel(
      nationName: "England",
      imagePath:
          "https://images-na.ssl-images-amazon.com/images/I/41WoGCA8nJL._AC_SY400_.jpg",
      countryId: "14"),
  NationModel(
      nationName: "France",
      imagePath:
          "https://generalleathercraft.com/wp-content/uploads/2018/03/France-Flag-Weightlifting-Belt.jpg",
      countryId: "18"),
  NationModel(
      nationName: "Italy",
      imagePath:
          "https://images-na.ssl-images-amazon.com/images/I/41Jx9i-EiNL._AC_SX450_.jpg",
      countryId: "27"),
  NationModel(
      nationName: "Spain",
      imagePath:
          "https://i.pinimg.com/originals/5e/5a/0d/5e5a0d9f894e9a426a6a573cf5e31027.jpg",
      countryId: "45")
];
