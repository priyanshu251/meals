import 'package:meals_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals; //jaha bhi ab provider ko bulaya jaaega tab ye callback hoga aur dummymeals return ho jaega
});
