package com.facebook.stetho.inspector;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/MismatchedResponseException.class */
public class MismatchedResponseException extends MessageHandlingException {
    public long mRequestId;

    public MismatchedResponseException(long requestId) {
        super("Response for request id " + requestId + ", but no such request is pending");
        this.mRequestId = requestId;
    }

    public long getRequestId() {
        return this.mRequestId;
    }
}
