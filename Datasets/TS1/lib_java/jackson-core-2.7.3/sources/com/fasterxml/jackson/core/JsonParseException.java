package com.fasterxml.jackson.core;

/* loaded from: jackson-core-2.7.3.jar:com/fasterxml/jackson/core/JsonParseException.class */
public class JsonParseException extends JsonProcessingException {
    private static final long serialVersionUID = 2;
    protected JsonParser _processor;

    @Deprecated
    public JsonParseException(String msg, JsonLocation loc) {
        super(msg, loc);
    }

    @Deprecated
    public JsonParseException(String msg, JsonLocation loc, Throwable root) {
        super(msg, loc, root);
    }

    public JsonParseException(JsonParser p, String msg) {
        super(msg, p == null ? null : p.getCurrentLocation());
        this._processor = p;
    }

    public JsonParseException(JsonParser p, String msg, Throwable root) {
        super(msg, p == null ? null : p.getCurrentLocation(), root);
        this._processor = p;
    }

    public JsonParseException(JsonParser p, String msg, JsonLocation loc) {
        super(msg, loc);
        this._processor = p;
    }

    public JsonParseException(JsonParser p, String msg, JsonLocation loc, Throwable root) {
        super(msg, loc, root);
        this._processor = p;
    }

    public JsonParseException withParser(JsonParser p) {
        this._processor = p;
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonProcessingException
    public JsonParser getProcessor() {
        return this._processor;
    }
}
