package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.json.annotation.JsonProperty;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/SimpleBooleanResult.class */
public class SimpleBooleanResult implements JsonRpcResult {

    @JsonProperty(required = true)
    public boolean result;

    public SimpleBooleanResult() {
    }

    public SimpleBooleanResult(boolean result) {
        this.result = result;
    }
}
