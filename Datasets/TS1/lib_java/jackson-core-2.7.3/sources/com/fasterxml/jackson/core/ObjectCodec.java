package com.fasterxml.jackson.core;

import com.fasterxml.jackson.core.type.ResolvedType;
import com.fasterxml.jackson.core.type.TypeReference;
import java.io.IOException;
import java.util.Iterator;

/* loaded from: jackson-core-2.7.3.jar:com/fasterxml/jackson/core/ObjectCodec.class */
public abstract class ObjectCodec extends TreeCodec implements Versioned {
    public abstract <T> T readValue(JsonParser jsonParser, Class<T> cls) throws IOException, JsonProcessingException;

    public abstract <T> T readValue(JsonParser jsonParser, TypeReference<?> typeReference) throws IOException, JsonProcessingException;

    public abstract <T> T readValue(JsonParser jsonParser, ResolvedType resolvedType) throws IOException, JsonProcessingException;

    public abstract <T> Iterator<T> readValues(JsonParser jsonParser, Class<T> cls) throws IOException, JsonProcessingException;

    public abstract <T> Iterator<T> readValues(JsonParser jsonParser, TypeReference<?> typeReference) throws IOException, JsonProcessingException;

    public abstract <T> Iterator<T> readValues(JsonParser jsonParser, ResolvedType resolvedType) throws IOException, JsonProcessingException;

    public abstract void writeValue(JsonGenerator jsonGenerator, Object obj) throws IOException, JsonProcessingException;

    @Override // com.fasterxml.jackson.core.TreeCodec
    public abstract <T extends TreeNode> T readTree(JsonParser jsonParser) throws IOException, JsonProcessingException;

    @Override // com.fasterxml.jackson.core.TreeCodec
    public abstract void writeTree(JsonGenerator jsonGenerator, TreeNode treeNode) throws IOException, JsonProcessingException;

    @Override // com.fasterxml.jackson.core.TreeCodec
    public abstract TreeNode createObjectNode();

    @Override // com.fasterxml.jackson.core.TreeCodec
    public abstract TreeNode createArrayNode();

    @Override // com.fasterxml.jackson.core.TreeCodec
    public abstract JsonParser treeAsTokens(TreeNode treeNode);

    public abstract <T> T treeToValue(TreeNode treeNode, Class<T> cls) throws JsonProcessingException;

    protected ObjectCodec() {
    }

    @Override // com.fasterxml.jackson.core.Versioned
    public Version version() {
        return Version.unknownVersion();
    }

    @Deprecated
    public JsonFactory getJsonFactory() {
        return getFactory();
    }

    public JsonFactory getFactory() {
        return getJsonFactory();
    }
}
