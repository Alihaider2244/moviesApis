import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<String> FavouriteListName = <String>[].obs;
  List<String> FavouriteListImage = <String>[].obs;
  List<String> FavouriteListRating = <String>[].obs;
  RxBool isFavorite = false.obs;

  RxBool isBright = true.obs;

  void toggleTheme() {
    isBright(!isBright.value);
  }

  void addToFavList(String name, image, rating) {
    FavouriteListName.add(name);
    FavouriteListImage.add(image);
    FavouriteListRating.add(rating);
  }

  void RemovefromFav(String name, image, rating) {
    FavouriteListName.remove(name);
    FavouriteListImage.remove(image);
    FavouriteListRating.remove(rating);
  }

}
