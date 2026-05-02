package com.facebook.stetho.inspector.jsonrpc.protocol;

import android.annotation.SuppressLint;
import com.facebook.stetho.json.annotation.JsonProperty;
import org.json.JSONObject;

@SuppressLint({"UsingDefaultJsonDeserializer", "EmptyJsonPropertyUse"})
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest.class */
public class JsonRpcRequest {

    @JsonProperty
    public Long id;

    @JsonProperty(required = true)
    public String method;

    @JsonProperty
    public JSONObject params;

    public JsonRpcRequest() {
    }

    public JsonRpcRequest(Long id, String method, JSONObject params) {
        this.id = id;
        this.method = method;
        this.params = params;
    }
}
