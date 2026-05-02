package com.facebook.stetho.inspector.helper;

import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/helper/PeerRegistrationListener.class */
public interface PeerRegistrationListener {
    void onPeerRegistered(JsonRpcPeer jsonRpcPeer);

    void onPeerUnregistered(JsonRpcPeer jsonRpcPeer);
}
