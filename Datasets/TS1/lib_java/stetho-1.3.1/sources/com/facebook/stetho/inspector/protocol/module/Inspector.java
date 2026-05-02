package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Inspector.class */
public class Inspector implements ChromeDevtoolsDomain {
    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
    }
}
