package com.facebook.stetho.inspector.jsonrpc.protocol;

import android.annotation.SuppressLint;
import com.facebook.stetho.json.annotation.JsonProperty;
import javax.annotation.Nullable;
import org.json.JSONObject;

@SuppressLint({"UsingDefaultJsonDeserializer", "EmptyJsonPropertyUse"})
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcEvent.class */
public class JsonRpcEvent {

    @JsonProperty(required = true)
    public String method;

    @JsonProperty
    public JSONObject params;

    public JsonRpcEvent() {
    }

    public JsonRpcEvent(String method, @Nullable JSONObject params) {
        this.method = method;
        this.params = params;
    }
}
