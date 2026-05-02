package com.google.gson;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collection;

/* loaded from: gson-1.7.2.jar:com/google/gson/JavaFieldNamingPolicy.class */
final class JavaFieldNamingPolicy extends RecursiveFieldNamingPolicy {
    JavaFieldNamingPolicy() {
    }

    @Override // com.google.gson.RecursiveFieldNamingPolicy
    protected String translateName(String target, Type fieldType, Collection<Annotation> annotations) {
        return target;
    }
}
