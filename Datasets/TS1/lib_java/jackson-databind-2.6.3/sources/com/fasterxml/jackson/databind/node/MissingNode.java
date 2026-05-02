package com.fasterxml.jackson.databind.node;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/node/MissingNode.class */
public final class MissingNode extends ValueNode {
    private static final MissingNode instance = new MissingNode();

    private MissingNode() {
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.JsonNode
    public <T extends JsonNode> T deepCopy() {
        return this;
    }

    public static MissingNode getInstance() {
        return instance;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public JsonNodeType getNodeType() {
        return JsonNodeType.MISSING;
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.node.BaseJsonNode
    public JsonToken asToken() {
        return JsonToken.NOT_AVAILABLE;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String asText() {
        return "";
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String asText(String defaultValue) {
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode, com.fasterxml.jackson.databind.JsonSerializable
    public final void serialize(JsonGenerator jg, SerializerProvider provider) throws IOException, JsonProcessingException {
        jg.writeNull();
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.node.BaseJsonNode, com.fasterxml.jackson.databind.JsonSerializable
    public void serializeWithType(JsonGenerator jg, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonProcessingException {
        jg.writeNull();
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public boolean equals(Object o) {
        return o == this;
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.JsonNode
    public String toString() {
        return "";
    }

    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode
    public int hashCode() {
        return JsonNodeType.MISSING.ordinal();
    }
}
