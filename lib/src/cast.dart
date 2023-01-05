T cast<T extends Object>(dynamic object) => object as T;
T? tryCast<T extends Object>(dynamic object) => object is T ? object : null;
