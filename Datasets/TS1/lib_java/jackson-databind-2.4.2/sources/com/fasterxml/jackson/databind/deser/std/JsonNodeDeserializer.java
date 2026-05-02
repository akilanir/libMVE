package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.NullNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/JsonNodeDeserializer.class */
public class JsonNodeDeserializer extends BaseNodeDeserializer<JsonNode> {
    private static final JsonNodeDeserializer instance = new JsonNodeDeserializer();

    @Override // com.fasterxml.jackson.databind.deser.std.BaseNodeDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public /* bridge */ /* synthetic */ Object deserializeWithType(JsonParser x0, DeserializationContext x1, TypeDeserializer x2) throws IOException {
        return super.deserializeWithType(x0, x1, x2);
    }

    protected JsonNodeDeserializer() {
        super(JsonNode.class);
    }

    public static JsonDeserializer<? extends JsonNode> getDeserializer(Class<?> nodeClass) {
        if (nodeClass == ObjectNode.class) {
            return ObjectDeserializer.getInstance();
        }
        if (nodeClass == ArrayNode.class) {
            return ArrayDeserializer.getInstance();
        }
        return instance;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public JsonNode getNullValue() {
        return NullNode.getInstance();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public JsonNode deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        switch (jp.getCurrentTokenId()) {
            case 1:
                return deserializeObject(jp, ctxt, ctxt.getNodeFactory());
            case 3:
                return deserializeArray(jp, ctxt, ctxt.getNodeFactory());
            default:
                return deserializeAny(jp, ctxt, ctxt.getNodeFactory());
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/JsonNodeDeserializer$ObjectDeserializer.class */
    static final class ObjectDeserializer extends BaseNodeDeserializer<ObjectNode> {
        private static final long serialVersionUID = 1;
        protected static final ObjectDeserializer _instance = new ObjectDeserializer();

        protected ObjectDeserializer() {
            super(ObjectNode.class);
        }

        public static ObjectDeserializer getInstance() {
            return _instance;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public ObjectNode deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            if (jp.getCurrentToken() == JsonToken.START_OBJECT) {
                jp.nextToken();
                return deserializeObject(jp, ctxt, ctxt.getNodeFactory());
            }
            if (jp.getCurrentToken() == JsonToken.FIELD_NAME) {
                return deserializeObject(jp, ctxt, ctxt.getNodeFactory());
            }
            throw ctxt.mappingException(ObjectNode.class);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/JsonNodeDeserializer$ArrayDeserializer.class */
    static final class ArrayDeserializer extends BaseNodeDeserializer<ArrayNode> {
        private static final long serialVersionUID = 1;
        protected static final ArrayDeserializer _instance = new ArrayDeserializer();

        protected ArrayDeserializer() {
            super(ArrayNode.class);
        }

        public static ArrayDeserializer getInstance() {
            return _instance;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public ArrayNode deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.isExpectedStartArrayToken()) {
                return deserializeArray(jp, ctxt, ctxt.getNodeFactory());
            }
            throw ctxt.mappingException(ArrayNode.class);
        }
    }
}
