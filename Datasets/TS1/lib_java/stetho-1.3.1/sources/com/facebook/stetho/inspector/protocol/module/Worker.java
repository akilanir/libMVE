package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Worker.class */
public class Worker implements ChromeDevtoolsDomain {
    @ChromeDevtoolsMethod
    public JsonRpcResult canInspectWorkers(JsonRpcPeer peer, JSONObject params) {
        return new SimpleBooleanResult(true);
    }
}
