extension ObjectExt on Object {
  /// Cast the current [Object] to the desired type ([T]).
  ///
  /// When called on a type that IS NOT of type [T], an error is thrown.
  /// If you rather recieve a [null] then light your program on fire,
  /// consider using [tryCast].
  T cast<T extends Object>() => this as T;

  /// Tries to cast the current [Object] to the desired type ([T]).
  ///
  /// When the [Object] is not of type [T], [null] is returned.
  T? tryCast<T extends Object>() => this is T ? this as T : null;
}
