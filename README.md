
This package allows you to cast your Objects in a more convenient way.

## Features

This package contains functions and extensions for casting objects.

### Functions

The functions are just another way of casting objects which might make it a bit
more readable and usable.

With `cast` you can force a cast. It will throw an error if the cast fails.

```dart
Car car = cast<Car>(vehicle); // vehicle as Car
```

If you are not sure if the cast will be valid, you can use `tryCast` to receive
a `null` when the cast fails.

```dart
Car? car = tryCast<Car>(vehicle); // vehicle is Car ? vehicle as Car : null
```

### Extensions

There are two extensions that allow for a more easy way to cast
objects and continue using them.

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

