import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data.dart';

final mealsProvider = Provider(
  (ref) => mealsList,
);
