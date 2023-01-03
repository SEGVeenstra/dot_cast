
This package allows you to cast your Objects in a more convinient way.

## Features

This package contains two extensions that allow for a more easy way to cast
objects.

With `cast` you can force a cast. You should only do this if you are 100% certain
that the cast is valid, or else an error is thrown.

```dart
Car car = vehicle.cast<Car>(); // vehicle as Car
```

If you are not 100% sure `cast` is going to work, you can use `tryCast`.
`tryCast` will return `null` if the cast fails.

```dart
Car? car = vehicle.tryCast<Car>(); // vehicle is Car ? vehicle as Car : null
```

These two extensions make it easier to use your casted objects.

For example when you only need to show items when your state has been loaded, you simply do the following:

```dart
final items = state.tryCast<Loaded>()?.items;
```