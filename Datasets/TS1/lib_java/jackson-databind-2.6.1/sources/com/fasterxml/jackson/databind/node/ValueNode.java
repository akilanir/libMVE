package com.fasterxml.jackson.databind.node;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonPointer;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;
import java.util.List;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/node/ValueNode.class */
public abstract class ValueNode extends BaseJsonNode {
    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode
    public abstract JsonToken asToken();

    protected ValueNode() {
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    protected JsonNode _at(JsonPointer ptr) {
        return MissingNode.getInstance();
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public <T extends JsonNode> T deepCopy() {
        return this;
    }

    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode, com.fasterxml.jackson.databind.JsonSerializable
    public void serializeWithType(JsonGenerator jg, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonProcessingException {
        typeSer.writeTypePrefixForScalar(this, jg);
        serialize(jg, provider);
        typeSer.writeTypeSuffixForScalar(this, jg);
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String toString() {
        return asText();
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    /* renamed from: get */
    public final JsonNode mo10get(int index) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    /* renamed from: path */
    public final JsonNode mo8path(int index) {
        return MissingNode.getInstance();
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final boolean has(int index) {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final boolean hasNonNull(int index) {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    /* renamed from: get */
    public final JsonNode mo11get(String fieldName) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    /* renamed from: path */
    public final JsonNode mo9path(String fieldName) {
        return MissingNode.getInstance();
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final boolean has(String fieldName) {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final boolean hasNonNull(String fieldName) {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final JsonNode findValue(String fieldName) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final ObjectNode findParent(String fieldName) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final List<JsonNode> findValues(String fieldName, List<JsonNode> foundSoFar) {
        return foundSoFar;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final List<String> findValuesAsText(String fieldName, List<String> foundSoFar) {
        return foundSoFar;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public final List<JsonNode> findParents(String fieldName, List<JsonNode> foundSoFar) {
        return foundSoFar;
    }
}
