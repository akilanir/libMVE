package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: gson-1.7.2.jar:com/google/gson/ObjectConstructor.class */
interface ObjectConstructor {
    <T> T construct(Type type);

    Object constructArray(Type type, int i);
}
