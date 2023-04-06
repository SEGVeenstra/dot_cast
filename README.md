[![codecov](https://codecov.io/gh/SEGVeenstra/dot_cast/branch/main/graph/badge.svg?token=9N8K5J2SNY)](https://codecov.io/gh/SEGVeenstra/dot_cast)

This package allows you to cast and check your Objects in a more convenient way.

## Features

This package contains functions and extensions for casting and checking objects.

### Functions

The functions are just another way of casting and checking objects which might make
it a bit more readable and usable.

#### cast

With `cast` you can force a cast. It will throw an error if the cast fails.

```dart
Car car = cast<Car>(vehicle); // vehicle as Car
```

#### tryCast

If you are not sure if the cast will be valid, you can use `tryCast` to receive
a `null` when the cast fails.

```dart
Car? car = tryCast<Car>(vehicle); // vehicle is Car ? vehicle as Car : null
```

#### isType

You can use `isType` to check wether an `Object` is of a certain type.
It will return `true` if the `Object` is the same type or a subclass.

```dart
bool isCar = isType<Car>(vehicle); // vehicle is Car
```

#### isExactType

You can also use `isExactType` to check wether an `Object` is of a certain type.
Unlike `isType`, this will only return `true` if the `Object` is exactly the given type.

```dart
bool isCar = isExactType<Car>(vehicle); // vehicle.runtimeType == Car
```

### Extensions

There also are extensions that allow for a more easy way to cast and check
objects and continue using them in your code.

With `.cast` you can force a cast. You should only do this if you are 100% certain
that the cast is valid, or else an error is thrown.

```dart
Car car = vehicle.cast<Car>(); // vehicle as Car
```

If you are not 100% sure `.cast` is going to work, you can use `.tryCast`.
`.tryCast` will return `null` if the cast fails.

```dart
Car? car = vehicle.tryCast<Car>(); // vehicle is Car ? vehicle as Car : null
```

These two extensions make it easier to use your casted objects.

For example when you only need to show items when your state has been loaded, you simply do the following:

```dart
final items = state.tryCast<Loaded>()?.items;
```

Also, both `isType` and `isExactType` have equivalent extensions available.

```dart
bool isCar = vehicle.isType<Car>(); // vehicle is Car

bool isVehicle = car.isExactType<Vehicle>(); // car.runtimeType == Vehicle

```

## Real World Examples

Below you will find real world examples for the use of this package.

### BlocSelector

I've used the [flutter_bloc](https://pub.dev/packages/flutter_bloc) package for a long time. One of my favorite widgets from that package is the `BlocSelector`.

The `BlocSelector` allows you to rebuild a piece of your UI on a very specific state change. Let's say we want to show the total amount of our shopping basket.

We can only show the amount when the basket has been loaded and there are products available, else we just show 0.
Without `dot_cast`, we could write it like this:

```dart
BlocSelector<BasketBloc, BasketState, double>(
    selector: (state) {
        if (state is! BasketLoaded) {
            return 0.0; // if it has not been loaded, return default
        }
        final products = state.product; // We can now get the products
        if (products == null) { 
            return 0.0; // if products is null, return default
        }
        // Here products has been promoted to be a non-nullable object
        return products.totalPrice; 
    },
    builder: (context, state) {
        // Build the widget
    }
)
```

Or as a single expression:

```dart
BlocSelector<BasketBloc, BasketState, double>(
    selector: (state) => state is BasketLoaded ? state.products?.totalPrice ?? 0.0 : 0.0,
    builder: (context, state) {
        // Build the widget
    }
)
```

I personally think combining all the different syntaxes makes the code look kind of messy. We have a test operator (`is`), the conditional operator (`test ? true : false`), null-check (`?`) and the if-null operator (`??`), all in one line. 

With `dot_cast`, we can turn remove half of those. The result looks like this:

```dart
BlocSelector<BasketBloc, BasketState, double>(
    selector: (state) => state.tryCast<BasketLoaded>()?.products?.totalPrice ?? 0.0,
    builder: (context, state) {
        // Build the widget
    }
)
```

In this last example we are able to write a single, readable, line.
Hopefully this gives you an idea on how this package can help you.

Other state management packages like [flutter_redux](https://pub.dev/packages/flutter_redux) and my own [etos_flutter](https://pub.dev/packages/etos_flutter) use the same concepts to allow for specific rebuilds.

