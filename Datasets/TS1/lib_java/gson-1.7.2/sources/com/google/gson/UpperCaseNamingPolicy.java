package com.google.gson;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collection;

/* loaded from: gson-1.7.2.jar:com/google/gson/UpperCaseNamingPolicy.class */
final class UpperCaseNamingPolicy extends RecursiveFieldNamingPolicy {
    UpperCaseNamingPolicy() {
    }

    @Override // com.google.gson.RecursiveFieldNamingPolicy
    protected String translateName(String target, Type fieldType, Collection<Annotation> annotations) {
        return target.toUpperCase();
    }
}
