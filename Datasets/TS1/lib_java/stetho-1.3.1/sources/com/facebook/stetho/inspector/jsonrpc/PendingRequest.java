package com.facebook.stetho.inspector.jsonrpc;

import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/jsonrpc/PendingRequest.class */
public class PendingRequest {
    public final long requestId;

    @Nullable
    public final PendingRequestCallback callback;

    public PendingRequest(long requestId, @Nullable PendingRequestCallback callback) {
        this.requestId = requestId;
        this.callback = callback;
    }
}
