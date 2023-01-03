import 'package:dot_cast/dot_cast.dart';
import 'package:test/test.dart';

void main() {
  test(
    'cast',
    () {
      final vehicles = <_Vehicle>[
        _Car(),
        _Plane(),
      ];

      final car = vehicles[0].cast<_Car>();
      final plane = vehicles[1].cast<_Plane>();

      expect(car.drive(), isTrue);
      expect(plane.fly(), isTrue);
    },
  );

  test(
    'tryCast',
    () {
      final vehicles = <_Vehicle>[
        _Car(),
        _Plane(),
      ];

      final carNull = vehicles[0].tryCast<_Plane>();
      final planeNull = vehicles[1].tryCast<_Car>();
      final car = vehicles[0].tryCast<_Car>();
      final plane = vehicles[1].tryCast<_Plane>();

      expect(carNull, null);
      expect(planeNull, null);
      expect(car?.drive(), isTrue);
      expect(plane?.fly(), isTrue);
    },
  );
}

class _Vehicle {}

class _Car extends _Vehicle {
  bool drive() => true;
}

class _Plane extends _Vehicle {
  bool fly() => true;
}
