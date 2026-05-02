package com.google.gson;

import com.google.gson.annotations.SerializedName;

/* loaded from: gson-1.7.2.jar:com/google/gson/SerializedNameAnnotationInterceptingNamingPolicy.class */
final class SerializedNameAnnotationInterceptingNamingPolicy implements FieldNamingStrategy2 {
    private final FieldNamingStrategy2 delegate;

    SerializedNameAnnotationInterceptingNamingPolicy(FieldNamingStrategy2 delegate) {
        this.delegate = delegate;
    }

    @Override // com.google.gson.FieldNamingStrategy2
    public String translateName(FieldAttributes f) {
        SerializedName serializedName = (SerializedName) f.getAnnotation(SerializedName.class);
        return serializedName == null ? this.delegate.translateName(f) : serializedName.value();
    }
}
