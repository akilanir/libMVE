package com.fasterxml.jackson.databind.node;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.Base64Variants;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/node/TextNode.class */
public class TextNode extends ValueNode {
    static final TextNode EMPTY_STRING_NODE = new TextNode("");
    protected final String _value;

    public TextNode(String v) {
        this._value = v;
    }

    public static TextNode valueOf(String v) {
        if (v == null) {
            return null;
        }
        if (v.length() == 0) {
            return EMPTY_STRING_NODE;
        }
        return new TextNode(v);
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public JsonNodeType getNodeType() {
        return JsonNodeType.STRING;
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.node.BaseJsonNode
    public JsonToken asToken() {
        return JsonToken.VALUE_STRING;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String textValue() {
        return this._value;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x003b, code lost:
    
        r0 = r8.decodeBase64Char(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0045, code lost:
    
        if (r0 >= 0) goto L13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0048, code lost:
    
        _reportInvalidBase64(r8, r0, 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0058, code lost:
    
        if (r11 < r0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x005b, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x005f, code lost:
    
        r11 = r11 + 1;
        r0 = r0.charAt(r11);
        r0 = r8.decodeBase64Char(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0074, code lost:
    
        if (r0 >= 0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0077, code lost:
    
        _reportInvalidBase64(r8, r0, 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x007f, code lost:
    
        r0 = (r0 << 6) | r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x008d, code lost:
    
        if (r11 < r0) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0094, code lost:
    
        if (r8.usesPadding() != false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0097, code lost:
    
        r0.append(r0 >> 4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00a6, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00aa, code lost:
    
        r11 = r11 + 1;
        r0 = r0.charAt(r11);
        r0 = r8.decodeBase64Char(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00bf, code lost:
    
        if (r0 >= 0) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00c6, code lost:
    
        if (r0 == (-2)) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00c9, code lost:
    
        _reportInvalidBase64(r8, r0, 2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00d5, code lost:
    
        if (r11 < r0) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00d8, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00dc, code lost:
    
        r11 = r11 + 1;
        r0 = r0.charAt(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00ed, code lost:
    
        if (r8.usesPaddingChar(r0) != false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00f0, code lost:
    
        _reportInvalidBase64(r8, r0, 3, "expected padding character '" + r8.getPaddingChar() + "'");
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0113, code lost:
    
        r0.append(r0 >> 4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0122, code lost:
    
        r0 = (r0 << 6) | r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0130, code lost:
    
        if (r11 < r0) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0137, code lost:
    
        if (r8.usesPadding() != false) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x013a, code lost:
    
        r0.appendTwoBytes(r0 >> 2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0149, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x014d, code lost:
    
        r11 = r11 + 1;
        r0 = r0.charAt(r11);
        r0 = r8.decodeBase64Char(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0162, code lost:
    
        if (r0 >= 0) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0169, code lost:
    
        if (r0 == (-2)) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x016c, code lost:
    
        _reportInvalidBase64(r8, r0, 3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0174, code lost:
    
        r0.appendTwoBytes(r0 >> 2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0183, code lost:
    
        r0.appendThreeBytes((r0 << 6) | r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] getBinaryValue(com.fasterxml.jackson.core.Base64Variant r8) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 411
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.node.TextNode.getBinaryValue(com.fasterxml.jackson.core.Base64Variant):byte[]");
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public byte[] binaryValue() throws IOException {
        return getBinaryValue(Base64Variants.getDefaultVariant());
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String asText() {
        return this._value;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public String asText(String defaultValue) {
        return this._value == null ? defaultValue : this._value;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public boolean asBoolean(boolean defaultValue) {
        if (this._value != null) {
            String v = this._value.trim();
            if ("true".equals(v)) {
                return true;
            }
            if ("false".equals(v)) {
                return false;
            }
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public int asInt(int defaultValue) {
        return NumberInput.parseAsInt(this._value, defaultValue);
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public long asLong(long defaultValue) {
        return NumberInput.parseAsLong(this._value, defaultValue);
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public double asDouble(double defaultValue) {
        return NumberInput.parseAsDouble(this._value, defaultValue);
    }

    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode, com.fasterxml.jackson.databind.JsonSerializable
    public final void serialize(JsonGenerator jg, SerializerProvider provider) throws IOException {
        if (this._value == null) {
            jg.writeNull();
        } else {
            jg.writeString(this._value);
        }
    }

    @Override // com.fasterxml.jackson.databind.JsonNode
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o != null && (o instanceof TextNode)) {
            return ((TextNode) o)._value.equals(this._value);
        }
        return false;
    }

    @Override // com.fasterxml.jackson.databind.node.BaseJsonNode
    public int hashCode() {
        return this._value.hashCode();
    }

    @Override // com.fasterxml.jackson.databind.node.ValueNode, com.fasterxml.jackson.databind.JsonNode
    public String toString() {
        int len = this._value.length();
        StringBuilder sb = new StringBuilder(len + 2 + (len >> 4));
        appendQuoted(sb, this._value);
        return sb.toString();
    }

    protected static void appendQuoted(StringBuilder sb, String content) {
        sb.append('\"');
        CharTypes.appendQuoted(sb, content);
        sb.append('\"');
    }

    protected void _reportInvalidBase64(Base64Variant b64variant, char ch, int bindex) throws JsonParseException {
        _reportInvalidBase64(b64variant, ch, bindex, null);
    }

    protected void _reportInvalidBase64(Base64Variant b64variant, char ch, int bindex, String msg) throws JsonParseException {
        String base;
        if (ch <= ' ') {
            base = "Illegal white space character (code 0x" + Integer.toHexString(ch) + ") as character #" + (bindex + 1) + " of 4-char base64 unit: can only used between units";
        } else if (b64variant.usesPaddingChar(ch)) {
            base = "Unexpected padding character ('" + b64variant.getPaddingChar() + "') as character #" + (bindex + 1) + " of 4-char base64 unit: padding only legal as 3rd or 4th character";
        } else if (!Character.isDefined(ch) || Character.isISOControl(ch)) {
            base = "Illegal character (code 0x" + Integer.toHexString(ch) + ") in base64 content";
        } else {
            base = "Illegal character '" + ch + "' (code 0x" + Integer.toHexString(ch) + ") in base64 content";
        }
        if (msg != null) {
            base = base + ": " + msg;
        }
        throw new JsonParseException(base, JsonLocation.NA);
    }

    protected void _reportBase64EOF() throws JsonParseException {
        throw new JsonParseException("Unexpected end-of-String when base64 content", JsonLocation.NA);
    }
}
