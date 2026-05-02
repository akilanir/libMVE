package com.google.gson;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: gson-1.7.2.jar:com/google/gson/MapAsArrayTypeAdapter.class */
final class MapAsArrayTypeAdapter extends BaseMapTypeAdapter implements JsonSerializer<Map<?, ?>>, JsonDeserializer<Map<?, ?>> {
    MapAsArrayTypeAdapter() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.gson.JsonDeserializer
    /* renamed from: deserialize */
    public Map<?, ?> deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
        Map<Object, Object> result = constructMapType(typeOfT, context);
        Type[] keyAndValueType = typeToTypeArguments(typeOfT);
        if (json.isJsonArray()) {
            JsonArray array = json.getAsJsonArray();
            for (int i = 0; i < array.size(); i++) {
                JsonArray entryArray = array.get(i).getAsJsonArray();
                Object k = context.deserialize(entryArray.get(0), keyAndValueType[0]);
                Object v = context.deserialize(entryArray.get(1), keyAndValueType[1]);
                result.put(k, v);
            }
            checkSize(array, array.size(), result, result.size());
        } else {
            JsonObject object = json.getAsJsonObject();
            for (Map.Entry<String, JsonElement> entry : object.entrySet()) {
                Object k2 = context.deserialize(new JsonPrimitive(entry.getKey()), keyAndValueType[0]);
                Object v2 = context.deserialize(entry.getValue(), keyAndValueType[1]);
                result.put(k2, v2);
            }
            checkSize(object, object.entrySet().size(), result, result.size());
        }
        return result;
    }

    @Override // com.google.gson.JsonSerializer
    public JsonElement serialize(Map<?, ?> src, Type typeOfSrc, JsonSerializationContext context) {
        Type[] keyAndValueType = typeToTypeArguments(typeOfSrc);
        boolean serializeAsArray = false;
        List<JsonElement> keysAndValues = new ArrayList<>();
        for (Map.Entry<?, ?> entry : src.entrySet()) {
            JsonElement key = serialize(context, entry.getKey(), keyAndValueType[0]);
            serializeAsArray |= key.isJsonObject() || key.isJsonArray();
            keysAndValues.add(key);
            keysAndValues.add(serialize(context, entry.getValue(), keyAndValueType[1]));
        }
        if (serializeAsArray) {
            JsonArray result = new JsonArray();
            for (int i = 0; i < keysAndValues.size(); i += 2) {
                JsonArray entryArray = new JsonArray();
                entryArray.add(keysAndValues.get(i));
                entryArray.add(keysAndValues.get(i + 1));
                result.add(entryArray);
            }
            return result;
        }
        JsonObject result2 = new JsonObject();
        for (int i2 = 0; i2 < keysAndValues.size(); i2 += 2) {
            result2.add(keysAndValues.get(i2).getAsString(), keysAndValues.get(i2 + 1));
        }
        checkSize(src, src.size(), result2, result2.entrySet().size());
        return result2;
    }

    private Type[] typeToTypeArguments(Type typeOfT) {
        if (typeOfT instanceof ParameterizedType) {
            Type[] typeArguments = ((ParameterizedType) typeOfT).getActualTypeArguments();
            if (typeArguments.length != 2) {
                throw new IllegalArgumentException("MapAsArrayTypeAdapter cannot handle " + typeOfT);
            }
            return typeArguments;
        }
        return new Type[]{Object.class, Object.class};
    }

    private void checkSize(Object input, int inputSize, Object output, int outputSize) {
        if (inputSize != outputSize) {
            throw new JsonSyntaxException("Input size " + inputSize + " != output size " + outputSize + " for input " + input + " and output " + output);
        }
    }
}
