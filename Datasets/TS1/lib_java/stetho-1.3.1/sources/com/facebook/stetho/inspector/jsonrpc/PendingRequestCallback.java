package com.facebook.stetho.inspector.jsonrpc;

import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcResponse;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/PendingRequestCallback.class */
public interface PendingRequestCallback {
    void onResponse(JsonRpcPeer jsonRpcPeer, JsonRpcResponse jsonRpcResponse);
}
