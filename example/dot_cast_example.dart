import 'package:dot_cast/dot_cast.dart';

void main() {
  Vehicle vehicle = Car();

  // cast

  final car = vehicle.cast<Car>(); // Car
  car.drive();

  final plane = vehicle.cast<Plane>(); // throws error!

  // tryCast

  final nullableCar = vehicle.tryCast<Car>(); // Car?
  nullableCar?.drive();

  final nullablePlane = vehicle.tryCast<Plane>(); // null
}

class Vehicle {}

class Car extends Vehicle {
  void drive() {}
}

class Plane extends Vehicle {
  void fly() {}
}
