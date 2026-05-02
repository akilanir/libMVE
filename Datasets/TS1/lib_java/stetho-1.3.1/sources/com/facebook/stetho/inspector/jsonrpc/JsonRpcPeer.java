package com.facebook.stetho.inspector.jsonrpc;

import android.database.Observable;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcRequest;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.websocket.SimpleSession;
import java.nio.channels.NotYetConnectedException;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;
import org.json.JSONObject;

@ThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/JsonRpcPeer.class */
public class JsonRpcPeer {
    private final SimpleSession mPeer;
    private final ObjectMapper mObjectMapper;

    @GuardedBy("this")
    private long mNextRequestId;

    @GuardedBy("this")
    private final Map<Long, PendingRequest> mPendingRequests = new HashMap();
    private final DisconnectObservable mDisconnectObservable = new DisconnectObservable();

    /*  JADX ERROR: Failed to decode insn: 0x0005: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    private synchronized long preparePendingRequest(com.facebook.stetho.inspector.jsonrpc.PendingRequestCallback r9) {
        /*
            r8 = this;
            r0 = r8
            r1 = r0
            long r1 = r1.mNextRequestId
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.mNextRequestId = r1
            r10 = r-1
            r-1 = r8
            java.util.Map<java.lang.Long, com.facebook.stetho.inspector.jsonrpc.PendingRequest> r-1 = r-1.mPendingRequests
            r0 = r10
            java.lang.Long r0 = java.lang.Long.valueOf(r0)
            com.facebook.stetho.inspector.jsonrpc.PendingRequest r1 = new com.facebook.stetho.inspector.jsonrpc.PendingRequest
            r2 = r1
            r3 = r10
            r4 = r9
            r2.<init>(r3, r4)
            r-1.put(r0, r1)
            r-1 = r10
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer.preparePendingRequest(com.facebook.stetho.inspector.jsonrpc.PendingRequestCallback):long");
    }

    public JsonRpcPeer(ObjectMapper objectMapper, SimpleSession peer) {
        this.mObjectMapper = objectMapper;
        this.mPeer = (SimpleSession) Util.throwIfNull(peer);
    }

    public SimpleSession getWebSocket() {
        return this.mPeer;
    }

    public void invokeMethod(String method, Object paramsObject, @Nullable PendingRequestCallback callback) throws NotYetConnectedException {
        Util.throwIfNull(method);
        Long requestId = callback != null ? Long.valueOf(preparePendingRequest(callback)) : null;
        JSONObject params = (JSONObject) this.mObjectMapper.convertValue(paramsObject, JSONObject.class);
        JsonRpcRequest message = new JsonRpcRequest(requestId, method, params);
        JSONObject jsonObject = (JSONObject) this.mObjectMapper.convertValue(message, JSONObject.class);
        String requestString = jsonObject.toString();
        this.mPeer.sendText(requestString);
    }

    public void registerDisconnectReceiver(DisconnectReceiver callback) {
        this.mDisconnectObservable.registerObserver(callback);
    }

    public void unregisterDisconnectReceiver(DisconnectReceiver callback) {
        this.mDisconnectObservable.unregisterObserver(callback);
    }

    public void invokeDisconnectReceivers() {
        this.mDisconnectObservable.onDisconnect();
    }

    public synchronized PendingRequest getAndRemovePendingRequest(long requestId) {
        return this.mPendingRequests.remove(Long.valueOf(requestId));
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$DisconnectObservable.class */
    private static class DisconnectObservable extends Observable<DisconnectReceiver> {
        private DisconnectObservable() {
        }

        public void onDisconnect() {
            int N = this.mObservers.size();
            for (int i = 0; i < N; i++) {
                DisconnectReceiver observer = (DisconnectReceiver) this.mObservers.get(i);
                observer.onDisconnect();
            }
        }
    }
}
