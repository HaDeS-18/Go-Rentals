import 'package:go_rentals/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}