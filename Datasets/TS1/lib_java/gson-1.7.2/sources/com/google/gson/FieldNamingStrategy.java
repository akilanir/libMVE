package com.google.gson;

import java.lang.reflect.Field;

/* loaded from: gson-1.7.2.jar:com/google/gson/FieldNamingStrategy.class */
public interface FieldNamingStrategy {
    String translateName(Field field);
}
