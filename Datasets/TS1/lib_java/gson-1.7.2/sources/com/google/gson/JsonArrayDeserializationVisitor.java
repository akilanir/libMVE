package com.google.gson;

import com.google.gson.internal.C$Gson$Types;
import java.lang.reflect.Array;
import java.lang.reflect.Type;

/* loaded from: gson-1.7.2.jar:com/google/gson/JsonArrayDeserializationVisitor.class */
final class JsonArrayDeserializationVisitor<T> extends JsonDeserializationVisitor<T> {
    JsonArrayDeserializationVisitor(JsonArray jsonArray, Type arrayType, ObjectNavigator objectNavigator, FieldNamingStrategy2 fieldNamingPolicy, ObjectConstructor objectConstructor, ParameterizedTypeHandlerMap<JsonDeserializer<?>> deserializers, JsonDeserializationContext context) {
        super(jsonArray, arrayType, objectNavigator, fieldNamingPolicy, objectConstructor, deserializers, context);
    }

    @Override // com.google.gson.JsonDeserializationVisitor
    protected T constructTarget() {
        if (!this.json.isJsonArray()) {
            throw new JsonParseException("Expecting array found: " + this.json);
        }
        JsonArray asJsonArray = this.json.getAsJsonArray();
        if (C$Gson$Types.isArray(this.targetType)) {
            return (T) this.objectConstructor.constructArray(C$Gson$Types.getArrayComponentType(this.targetType), asJsonArray.size());
        }
        return (T) this.objectConstructor.construct(C$Gson$Types.getRawType(this.targetType));
    }

    @Override // com.google.gson.ObjectNavigator.Visitor
    public void visitArray(Object array, Type arrayType) {
        Object obj;
        if (!this.json.isJsonArray()) {
            throw new JsonParseException("Expecting array found: " + this.json);
        }
        JsonArray jsonArray = this.json.getAsJsonArray();
        for (int i = 0; i < jsonArray.size(); i++) {
            JsonElement jsonChild = jsonArray.get(i);
            if (jsonChild == null || jsonChild.isJsonNull()) {
                obj = null;
            } else if (jsonChild instanceof JsonObject) {
                obj = visitChildAsObject(C$Gson$Types.getArrayComponentType(arrayType), jsonChild);
            } else if (jsonChild instanceof JsonArray) {
                obj = visitChildAsArray(C$Gson$Types.getArrayComponentType(arrayType), jsonChild.getAsJsonArray());
            } else if (jsonChild instanceof JsonPrimitive) {
                obj = visitChildAsObject(C$Gson$Types.getArrayComponentType(arrayType), jsonChild.getAsJsonPrimitive());
            } else {
                throw new IllegalStateException();
            }
            Object child = obj;
            Array.set(array, i, child);
        }
    }

    @Override // com.google.gson.ObjectNavigator.Visitor
    public void startVisitingObject(Object node) {
        throw new JsonParseException("Expecting array but found object: " + node);
    }

    @Override // com.google.gson.ObjectNavigator.Visitor
    public void visitArrayField(FieldAttributes f, Type typeOfF, Object obj) {
        throw new JsonParseException("Expecting array but found array field " + f.getName() + ": " + obj);
    }

    @Override // com.google.gson.ObjectNavigator.Visitor
    public void visitObjectField(FieldAttributes f, Type typeOfF, Object obj) {
        throw new JsonParseException("Expecting array but found object field " + f.getName() + ": " + obj);
    }

    @Override // com.google.gson.ObjectNavigator.Visitor
    public boolean visitFieldUsingCustomHandler(FieldAttributes f, Type actualTypeOfField, Object parent) {
        throw new JsonParseException("Expecting array but found field " + f.getName() + ": " + parent);
    }

    @Override // com.google.gson.ObjectNavigator.Visitor
    public void visitPrimitive(Object primitive) {
        throw new JsonParseException("Type information is unavailable, and the target is not a primitive: " + this.json);
    }
}
