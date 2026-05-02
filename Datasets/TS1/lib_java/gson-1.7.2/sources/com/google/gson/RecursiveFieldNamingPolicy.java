package com.google.gson;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collection;

/* loaded from: gson-1.7.2.jar:com/google/gson/RecursiveFieldNamingPolicy.class */
abstract class RecursiveFieldNamingPolicy implements FieldNamingStrategy2 {
    protected abstract String translateName(String str, Type type, Collection<Annotation> collection);

    RecursiveFieldNamingPolicy() {
    }

    @Override // com.google.gson.FieldNamingStrategy2
    public final String translateName(FieldAttributes f) {
        return translateName(f.getName(), f.getDeclaredType(), f.getAnnotations());
    }
}
