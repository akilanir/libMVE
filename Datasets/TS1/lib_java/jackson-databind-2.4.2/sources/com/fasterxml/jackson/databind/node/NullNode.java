package com.fasterxml.jackson.databind.node;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/node/NullNode.class */
public final class NullNode extends ValueNode {
    public static final NullNode instance = new NullNode();

    private NullNode() {
    }

    public static NullNode getInstance() {
        return instance;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public JsonNodeType getNodeType() {
        return JsonNodeType.NULL;
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.node.BaseJsonNode
    public JsonToken asToken() {
        return JsonToken.VALUE_NULL;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String asText(String defaultValue) {
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String asText() {
        return "null";
    }

    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode, com.fasterxml.jackson.databind.JsonSerializable
    public final void serialize(JsonGenerator jg, SerializerProvider provider) throws IOException, JsonProcessingException {
        provider.defaultSerializeNull(jg);
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public boolean equals(Object o) {
        return o == this;
    }
}
