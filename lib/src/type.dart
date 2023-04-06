
bool isType<T>(Object object) => object is T;

bool isExactType<T>(Object object) => object.runtimeType == T;
