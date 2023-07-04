import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

//this class is instanciated as an extension to your own class //stateNotifierProvider class works together with another class just as stateful widgtes work with state objects
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier()
      : super(
            []); //setting initial data that will be stored in this notifier here that is an empty list
// we cannot add or remove new meals in the above lsit as this package does not allow to change the existing object in memory
//we have to assign a new object with updated value

  bool toggleMealFavoritesStatus(Meal meal) {
    final mealIsFavorite = state.contains(
        meal); //this line looks if the provided meal is present in the originally initiated object (this is allowed as it does not changes the objrct just looks into it)

    if (mealIsFavorite) {
      state = state //.where will filter an list and return a new list
          .where(
            //where method is used to filter a collection it can be list, array, set etc.
            (m) =>
                m.id !=
                meal.id, //m represents the list already present in the state, if m.id does not match the passed meal.id then it returns true, returning true represents filter condition is achieved hence keep it the new collection that will be formed
            //if the id matches then it returns false ie. dio not include that item in the new collection
          )
          .toList();
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; //... is called the spread operator it first pull out all the existing items then add new item(separated by ,) ; this is allowed as a new state is initialised with existing + new value; not added new one in existing
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifier(); //provide instance of our class
  },
); // this class is used for data that can change
