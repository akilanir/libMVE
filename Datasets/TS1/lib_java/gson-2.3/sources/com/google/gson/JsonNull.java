package com.google.gson;

/* loaded from: gson-2.3.jar:com/google/gson/JsonNull.class */
public final class JsonNull extends JsonElement {
    public static final JsonNull INSTANCE = new JsonNull();

    @Deprecated
    public JsonNull() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.gson.JsonElement
    public JsonNull deepCopy() {
        return INSTANCE;
    }

    public int hashCode() {
        return JsonNull.class.hashCode();
    }

    public boolean equals(Object other) {
        return this == other || (other instanceof JsonNull);
    }
}
