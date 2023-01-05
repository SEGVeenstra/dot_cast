import 'package:dot_cast/dot_cast.dart';

void main() {
  //==========================
  // Cast examples
  //==========================

  final json = {
    'string': 'String',
    'int': 1337,
    'intList': [1, 2, 3, 4],
  };

  // cast

  final string = cast<String>(json['string']); // String
  final number = cast<int>(json['int']); // int
  final intList = cast<List<int>>(json['intList']); // List<int>

  // tryCast

  final noString = tryCast<String>(json['int']); // null
  final noNumber = tryCast<int>(json['string']); // null

  //==========================
  // Cast extensions examples
  //==========================

  Vehicle vehicle = Car();

  // cast extension

  final car = vehicle.cast<Car>(); // Car
  car.drive();

  final plane = vehicle.cast<Plane>(); // throws error!

  // tryCast extension

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
