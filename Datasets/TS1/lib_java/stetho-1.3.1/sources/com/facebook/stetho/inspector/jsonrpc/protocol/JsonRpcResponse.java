package com.facebook.stetho.inspector.jsonrpc.protocol;

import android.annotation.SuppressLint;
import com.facebook.stetho.json.annotation.JsonProperty;
import org.json.JSONObject;

@SuppressLint({"UsingDefaultJsonDeserializer", "EmptyJsonPropertyUse"})
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse.class */
public class JsonRpcResponse {

    @JsonProperty(required = true)
    public long id;

    @JsonProperty
    public JSONObject result;

    @JsonProperty
    public JSONObject error;
}
