package com.google.gson;

import com.google.gson.internal.C$Gson$Preconditions;

/* loaded from: gson-1.7.2.jar:com/google/gson/FieldNamingStrategy2Adapter.class */
final class FieldNamingStrategy2Adapter implements FieldNamingStrategy2 {
    private final FieldNamingStrategy adaptee;

    FieldNamingStrategy2Adapter(FieldNamingStrategy adaptee) {
        this.adaptee = (FieldNamingStrategy) C$Gson$Preconditions.checkNotNull(adaptee);
    }

    @Override // com.google.gson.FieldNamingStrategy2
    public String translateName(FieldAttributes f) {
        return this.adaptee.translateName(f.getFieldObject());
    }
}
