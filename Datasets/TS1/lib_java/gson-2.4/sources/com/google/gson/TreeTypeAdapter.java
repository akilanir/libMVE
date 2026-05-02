package com.google.gson;

import com.google.gson.internal.C$Gson$Preconditions;
import com.google.gson.internal.Streams;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

/* loaded from: gson-2.4.jar:com/google/gson/TreeTypeAdapter.class */
final class TreeTypeAdapter<T> extends TypeAdapter<T> {
    private final JsonSerializer<T> serializer;
    private final JsonDeserializer<T> deserializer;
    private final Gson gson;
    private final TypeToken<T> typeToken;
    private final TypeAdapterFactory skipPast;
    private TypeAdapter<T> delegate;

    private TreeTypeAdapter(JsonSerializer<T> serializer, JsonDeserializer<T> deserializer, Gson gson, TypeToken<T> typeToken, TypeAdapterFactory skipPast) {
        this.serializer = serializer;
        this.deserializer = deserializer;
        this.gson = gson;
        this.typeToken = typeToken;
        this.skipPast = skipPast;
    }

    @Override // com.google.gson.TypeAdapter
    /* renamed from: read */
    public T read2(JsonReader in) throws IOException {
        if (this.deserializer == null) {
            return delegate().read2(in);
        }
        JsonElement value = Streams.parse(in);
        if (value.isJsonNull()) {
            return null;
        }
        return this.deserializer.deserialize(value, this.typeToken.getType(), this.gson.deserializationContext);
    }

    @Override // com.google.gson.TypeAdapter
    public void write(JsonWriter out, T value) throws IOException {
        if (this.serializer == null) {
            delegate().write(out, value);
        } else if (value == null) {
            out.nullValue();
        } else {
            JsonElement tree = this.serializer.serialize(value, this.typeToken.getType(), this.gson.serializationContext);
            Streams.write(tree, out);
        }
    }

    private TypeAdapter<T> delegate() {
        TypeAdapter<T> d = this.delegate;
        if (d != null) {
            return d;
        }
        TypeAdapter<T> delegateAdapter = this.gson.getDelegateAdapter(this.skipPast, this.typeToken);
        this.delegate = delegateAdapter;
        return delegateAdapter;
    }

    public static TypeAdapterFactory newFactory(TypeToken<?> exactType, Object typeAdapter) {
        return new SingleTypeFactory(typeAdapter, exactType, false, null);
    }

    public static TypeAdapterFactory newFactoryWithMatchRawType(TypeToken<?> exactType, Object typeAdapter) {
        boolean matchRawType = exactType.getType() == exactType.getRawType();
        return new SingleTypeFactory(typeAdapter, exactType, matchRawType, null);
    }

    public static TypeAdapterFactory newTypeHierarchyFactory(Class<?> hierarchyType, Object typeAdapter) {
        return new SingleTypeFactory(typeAdapter, null, false, hierarchyType);
    }

    /* loaded from: gson-2.4.jar:com/google/gson/TreeTypeAdapter$SingleTypeFactory.class */
    private static class SingleTypeFactory implements TypeAdapterFactory {
        private final TypeToken<?> exactType;
        private final boolean matchRawType;
        private final Class<?> hierarchyType;
        private final JsonSerializer<?> serializer;
        private final JsonDeserializer<?> deserializer;

        private SingleTypeFactory(Object typeAdapter, TypeToken<?> exactType, boolean matchRawType, Class<?> hierarchyType) {
            this.serializer = typeAdapter instanceof JsonSerializer ? (JsonSerializer) typeAdapter : null;
            this.deserializer = typeAdapter instanceof JsonDeserializer ? (JsonDeserializer) typeAdapter : null;
            C$Gson$Preconditions.checkArgument((this.serializer == null && this.deserializer == null) ? false : true);
            this.exactType = exactType;
            this.matchRawType = matchRawType;
            this.hierarchyType = hierarchyType;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> type) {
            boolean matches = this.exactType != null ? this.exactType.equals(type) || (this.matchRawType && this.exactType.getType() == type.getRawType()) : this.hierarchyType.isAssignableFrom(type.getRawType());
            if (matches) {
                return new TreeTypeAdapter(this.serializer, this.deserializer, gson, type, this);
            }
            return null;
        }
    }
}
