package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.JsonPointer;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.databind.node.JsonNodeType;
import com.fasterxml.jackson.databind.node.MissingNode;
import com.fasterxml.jackson.databind.util.EmptyIterator;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/JsonNode.class */
public abstract class JsonNode implements TreeNode, Iterable<JsonNode> {
    public abstract <T extends JsonNode> T deepCopy();

    @Override // 
    /* renamed from: get, reason: merged with bridge method [inline-methods] */
    public abstract JsonNode mo9get(int i);

    @Override // 
    /* renamed from: path, reason: merged with bridge method [inline-methods] */
    public abstract JsonNode mo8path(String str);

    @Override // 
    /* renamed from: path, reason: merged with bridge method [inline-methods] */
    public abstract JsonNode mo7path(int i);

    protected abstract JsonNode _at(JsonPointer jsonPointer);

    public abstract JsonNodeType getNodeType();

    public abstract String asText();

    public abstract JsonNode findValue(String str);

    public abstract JsonNode findPath(String str);

    public abstract JsonNode findParent(String str);

    public abstract List<JsonNode> findValues(String str, List<JsonNode> list);

    public abstract List<String> findValuesAsText(String str, List<String> list);

    public abstract List<JsonNode> findParents(String str, List<JsonNode> list);

    public abstract String toString();

    public abstract boolean equals(Object obj);

    protected JsonNode() {
    }

    public int size() {
        return 0;
    }

    public final boolean isValueNode() {
        switch (getNodeType()) {
            case ARRAY:
            case OBJECT:
            case MISSING:
                return false;
            default:
                return true;
        }
    }

    public final boolean isContainerNode() {
        JsonNodeType type = getNodeType();
        return type == JsonNodeType.OBJECT || type == JsonNodeType.ARRAY;
    }

    public final boolean isMissingNode() {
        return getNodeType() == JsonNodeType.MISSING;
    }

    public final boolean isArray() {
        return getNodeType() == JsonNodeType.ARRAY;
    }

    public final boolean isObject() {
        return getNodeType() == JsonNodeType.OBJECT;
    }

    @Override // 
    /* renamed from: get, reason: merged with bridge method [inline-methods] */
    public JsonNode mo10get(String fieldName) {
        return null;
    }

    public Iterator<String> fieldNames() {
        return EmptyIterator.instance();
    }

    /* renamed from: at, reason: merged with bridge method [inline-methods] */
    public final JsonNode m6at(JsonPointer ptr) {
        if (ptr.matches()) {
            return this;
        }
        JsonNode n = _at(ptr);
        if (n == null) {
            return MissingNode.getInstance();
        }
        return n.m6at(ptr.tail());
    }

    /* renamed from: at, reason: merged with bridge method [inline-methods] */
    public final JsonNode m5at(String jsonPtrExpr) {
        return m6at(JsonPointer.compile(jsonPtrExpr));
    }

    public final boolean isPojo() {
        return getNodeType() == JsonNodeType.POJO;
    }

    public final boolean isNumber() {
        return getNodeType() == JsonNodeType.NUMBER;
    }

    public boolean isIntegralNumber() {
        return false;
    }

    public boolean isFloatingPointNumber() {
        return false;
    }

    public boolean isShort() {
        return false;
    }

    public boolean isInt() {
        return false;
    }

    public boolean isLong() {
        return false;
    }

    public boolean isFloat() {
        return false;
    }

    public boolean isDouble() {
        return false;
    }

    public boolean isBigDecimal() {
        return false;
    }

    public boolean isBigInteger() {
        return false;
    }

    public final boolean isTextual() {
        return getNodeType() == JsonNodeType.STRING;
    }

    public final boolean isBoolean() {
        return getNodeType() == JsonNodeType.BOOLEAN;
    }

    public final boolean isNull() {
        return getNodeType() == JsonNodeType.NULL;
    }

    public final boolean isBinary() {
        return getNodeType() == JsonNodeType.BINARY;
    }

    public boolean canConvertToInt() {
        return false;
    }

    public boolean canConvertToLong() {
        return false;
    }

    public String textValue() {
        return null;
    }

    public byte[] binaryValue() throws IOException {
        return null;
    }

    public boolean booleanValue() {
        return false;
    }

    public Number numberValue() {
        return null;
    }

    public short shortValue() {
        return (short) 0;
    }

    public int intValue() {
        return 0;
    }

    public long longValue() {
        return 0L;
    }

    public float floatValue() {
        return 0.0f;
    }

    public double doubleValue() {
        return 0.0d;
    }

    public BigDecimal decimalValue() {
        return BigDecimal.ZERO;
    }

    public BigInteger bigIntegerValue() {
        return BigInteger.ZERO;
    }

    public String asText(String defaultValue) {
        String str = asText();
        return str == null ? defaultValue : str;
    }

    public int asInt() {
        return asInt(0);
    }

    public int asInt(int defaultValue) {
        return defaultValue;
    }

    public long asLong() {
        return asLong(0L);
    }

    public long asLong(long defaultValue) {
        return defaultValue;
    }

    public double asDouble() {
        return asDouble(0.0d);
    }

    public double asDouble(double defaultValue) {
        return defaultValue;
    }

    public boolean asBoolean() {
        return asBoolean(false);
    }

    public boolean asBoolean(boolean defaultValue) {
        return defaultValue;
    }

    public boolean has(String fieldName) {
        return mo10get(fieldName) != null;
    }

    public boolean has(int index) {
        return mo9get(index) != null;
    }

    public boolean hasNonNull(String fieldName) {
        JsonNode n = mo10get(fieldName);
        return (n == null || n.isNull()) ? false : true;
    }

    public boolean hasNonNull(int index) {
        JsonNode n = mo9get(index);
        return (n == null || n.isNull()) ? false : true;
    }

    @Override // java.lang.Iterable
    public final Iterator<JsonNode> iterator() {
        return elements();
    }

    public Iterator<JsonNode> elements() {
        return EmptyIterator.instance();
    }

    public Iterator<Map.Entry<String, JsonNode>> fields() {
        return EmptyIterator.instance();
    }

    public final List<JsonNode> findValues(String fieldName) {
        List<JsonNode> result = findValues(fieldName, null);
        if (result == null) {
            return Collections.emptyList();
        }
        return result;
    }

    public final List<String> findValuesAsText(String fieldName) {
        List<String> result = findValuesAsText(fieldName, null);
        if (result == null) {
            return Collections.emptyList();
        }
        return result;
    }

    public final List<JsonNode> findParents(String fieldName) {
        List<JsonNode> result = findParents(fieldName, null);
        if (result == null) {
            return Collections.emptyList();
        }
        return result;
    }

    public JsonNode with(String propertyName) {
        throw new UnsupportedOperationException("JsonNode not of type ObjectNode (but " + getClass().getName() + "), can not call with() on it");
    }

    public JsonNode withArray(String propertyName) {
        throw new UnsupportedOperationException("JsonNode not of type ObjectNode (but " + getClass().getName() + "), can not call withArray() on it");
    }
}
