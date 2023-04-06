import 'package:dot_cast/dot_cast.dart';
import 'package:test/test.dart';

void main() {
  test(
    'cast',
    () {
      final json = {
        'string': 'String',
        'int': 1234,
      };

      final string = cast<String>(json['string']);
      final number = cast<int>(json['int']);

      expect(string, 'String');
      expect(number, 1234);
    },
  );

  test(
    'tryCast',
    () {
      final json = {
        'string': 'String',
        'int': 1234,
      };

      final string = tryCast<String>(json['string']);
      final number = tryCast<int>(json['int']);
      final notAstring = tryCast<int>(json['string']);
      final notAnumber = tryCast<String>(json['int']);

      expect(string, 'String');
      expect(number, 1234);
      expect(notAnumber, null);
      expect(notAstring, null);
    },
  );

  test(
    'isType / isExactType',
    () {
      final car = _Car();
      final vehicle = _Vehicle();

      expect(isType<_Car>(car), true);
      expect(isType<_Vehicle>(car), true);
      expect(isExactType<_Car>(car), true);
      expect(isExactType<_Vehicle>(car), false);
      expect(isExactType<_Vehicle>(vehicle), true);
    },
  );

  test(
    'cast extension',
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
    'tryCast extension',
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

  test(
    'isType/isExactType extension',
    () {
      final vehicles = <_Vehicle>[
        _Car(),
        _Plane(),
      ];

      expect(vehicles[0].isType<_Vehicle>(), true);
      expect(vehicles[0].isType<_Plane>(), false);
      expect(vehicles[0].isType<_Car>(), true);
      expect(vehicles[1].isType<_Vehicle>(), true);
      expect(vehicles[1].isType<_Plane>(), true);
      expect(vehicles[1].isType<_Car>(), false);

      expect(vehicles[0].isExactType<_Vehicle>(), false);
      expect(vehicles[0].isExactType<_Plane>(), false);
      expect(vehicles[0].isExactType<_Car>(), true);
      expect(vehicles[1].isExactType<_Vehicle>(), false);
      expect(vehicles[1].isExactType<_Plane>(), true);
      expect(vehicles[1].isExactType<_Car>(), false);
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
