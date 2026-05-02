package com.facebook.stetho.inspector.jsonrpc.protocol;

import android.annotation.SuppressLint;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import javax.annotation.Nullable;
import org.json.JSONObject;

@SuppressLint({"UsingDefaultJsonDeserializer", "EmptyJsonPropertyUse"})
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError.class */
public class JsonRpcError {

    @JsonProperty(required = true)
    public ErrorCode code;

    @JsonProperty(required = true)
    public String message;

    @JsonProperty
    public JSONObject data;

    public JsonRpcError() {
    }

    public JsonRpcError(ErrorCode code, String message, @Nullable JSONObject data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode.class */
    public enum ErrorCode {
        PARSER_ERROR(-32700),
        INVALID_REQUEST(-32600),
        METHOD_NOT_FOUND(-32601),
        INVALID_PARAMS(-32602),
        INTERNAL_ERROR(-32603);

        private final int mProtocolValue;

        ErrorCode(int protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public int getProtocolValue() {
            return this.mProtocolValue;
        }
    }
}
